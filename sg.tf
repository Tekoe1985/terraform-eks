resource "aws_security_group" "eks-sg" {
  name        = "eks-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "eks-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "eks-sg_ingress" {
  security_group_id = aws_security_group.eks-sg.id
  cidr_ipv4         = module.vpc.vpc_cidr_block
  from_port         = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
  to_port           = 0
}

resource "aws_vpc_security_group_egress_rule" "eks-sg_egress" {
  security_group_id = aws_security_group.eks-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

