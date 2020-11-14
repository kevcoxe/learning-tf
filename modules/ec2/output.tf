
output "server_private_ip" {
  value = aws_instance.web-server-instance.private_ip
}