module "subnets" {
  source = "./subnets"

  availability_zone = var.availability_zone
  default_vpc_id = var.default_vpc_id
  env = var.env

  for_each = var.subnets
  cidr_block = each.value.cidr_block
  name = each.value.name

  vpc_id = aws_vpc.main.id  //these are just local which are created
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  tags = local.common_tags


}

//i am just trying to segrigate the things