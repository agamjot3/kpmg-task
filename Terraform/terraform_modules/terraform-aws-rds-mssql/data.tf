####Availability Zones####
data "aws_availability_zones" "availabe_az" {
  state = "available"
}