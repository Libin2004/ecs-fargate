output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  value       = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  value       = aws_subnet.public_2.id
}

output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table.public_rt.id
}