resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Security group for the bastion host"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow SSH from my IP"
    cidr_blocks = [var.my_ip_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Allow all outbound traffic"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Security group for private instances"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow SSH from bastion host"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Allow all outbound traffic"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}


resource "aws_iam_role" "ssm_role" {
  name = "ec2_ssm_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ec2_ssm_profile"
  role = aws_iam_role.ssm_role.name
}


resource "aws_instance" "bastion_host" {
  ami           = "ami-020cba7c55df1f615" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name = "oxgood-key" # Replace with your key pair name
  
  tags = {
    Name = "BastionHost"
  }
  
}

resource "aws_instance" "private_instance" {
  ami           = "ami-020cba7c55df1f615" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  
  user_data = <<-EOF
                  #!/bin/bash
                  sleep 30 # Wait for the network to be ready
                  sudo apt update -y
                  sudo apt install -y apache2
                  sudo systemctl start apache2
                  sudo systemctl enable apache2
                  echo "<h1>Hello from Terraform!</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "PrivateInstance"
  }

}
