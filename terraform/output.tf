output "ec2_public_ip" {
  value = aws_instance.ai_server.public_ip
}
