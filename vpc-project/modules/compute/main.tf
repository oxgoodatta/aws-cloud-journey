#ec2 instance
resource "aws_instance" "public_instance" {
    ami = var.ami # Example AMI, replace with a valid one
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id # Use the public subnet ID from the network module
    key_name = var.key_name # Replace with your key pair name
    vpc_security_group_ids = [var.public_sg_id] # Use the security group ID from the security module

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install -y apache2
                sudo systemctl start apache2
                sudo systemctl enable apache2
                echo "<h1>Hello from Terraform!</h1>" | sudo tee /var/www/html/index.html
            EOF

    tags = {
        Name = "public-instance"
    }
}



#ec2 instance in private subnet
resource "aws_instance" "private_instance" {
    ami = var.ami # Example AMI, replace with a valid one
    instance_type = var.instance_type
    subnet_id = var.private_subnet_id
    vpc_security_group_ids = [var.private_sg_id]
    key_name = var.key_name # Replace with your key pair name

    tags = {
        Name = "private-instance"
    }
}

