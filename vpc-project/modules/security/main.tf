#security group for public instance
resource "aws_security_group" "public_sg" {
    vpc_id = var.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = var.ingress_protocol
        cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = var.ingress_protocol
        cidr_blocks =  [var.my_specific_ip] # Allow SSH from your IP address
        description = "Allow SSH from specific IP"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = var.egress_protocol # Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "public-sg"
    }
}


#security group for private instance
resource "aws_security_group" "private_sg" {
    vpc_id = var.vpc_id

    ingress {
        description = "Allow SSH from public security group"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.public_sg.id] # Allow SSH from public security group
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = var.egress_protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "private-sg"
    }
}