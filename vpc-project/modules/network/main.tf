#vpc
resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr_block

    tags = {
        Name = "main-vpc"
    }
}

#internet_gateway
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.main.id 

    tags = {
        Name = "main-igw"
    }
}

#public subnet
resource "aws_subnet" "public"{
    vpc_id = aws_vpc.main.id 
    cidr_block = var.public_subnet_cidr
    availability_zone = var.subnet_availability_zone
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet"
    }
}

#private subnet
resource "aws_subnet" "private"{
    vpc_id = aws_vpc.main.id 
    cidr_block = var.private_subnet_cidr
    availability_zone = var.subnet_availability_zone
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet"
    }
}

#elastic ip 
resource "aws_eip" "eip"{
    domain = "vpc"

    tags = {
    Name = "nat-eip"
  }
}

#nat gateway 
resource "aws_nat_gateway" "nat"{
    subnet_id = aws_subnet.public.id
    allocation_id = aws_eip.eip.id 
    depends_on    = [aws_internet_gateway.igw, aws_eip.eip]

    tags = {
        Name = "vpc-nat"
    }
}

#route table
resource "aws_route_table" "public"{
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {Name = "public-rt"}
}

#route table
resource "aws_route_table" "private"{
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
    
    tags = {Name = "private-rt"}
}


#route table associate
resource "aws_route_table_association" "public"{
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

#route table associate
resource "aws_route_table_association" "private"{
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}
