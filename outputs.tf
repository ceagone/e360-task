output "instance_Id" {
  value = aws_instance.e360-web.id
}

output "PublicIpAddress" {
  value = aws_instance.e360-web.public_ip
}