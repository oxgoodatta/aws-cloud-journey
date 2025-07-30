resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zone
  cidr_block        = var.public_subnet_cidr_block
  map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet"
    }
  
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zone
  cidr_block        = var.private_subnet_cidr_block
  map_public_ip_on_launch = false   

    tags = {
        Name = "private-subnet"
    }
  
}

resource "aws_eip" "my-eip" {
    domain = "vpc"
    
    tags = {
        Name = "my-eip"
    }
  
}

resource "aws_nat_gateway" "main-nat" {
    allocation_id = aws_eip.my-eip.id
    subnet_id     = aws_subnet.public_subnet.id
    
    tags = {
        Name = "nat-gateway"
    }
  
}

resource "aws_route_table" "publicz-rt" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
  
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main-nat.id    
    }
  
}

resource "aws_route_table_association" "public-subnet-rt-assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.publicz-rt.id
  
}

resource "aws_route_table_association" "private-subnet-rt-assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private-rt.id
  
}


