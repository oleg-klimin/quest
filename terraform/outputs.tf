output "instance_ext_ip" {
  value = aws_instance.quest-tf.public_ip
}

output "load_balancer_DNS_name" {
  value = aws_lb.questTfLB.dns_name
}

output "open_in_you_brouser" {
  value = aws_route53_record.quest.name
}
