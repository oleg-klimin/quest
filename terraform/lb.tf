resource "aws_lb" "questTfLB" {
  name               = "quesTtfLB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.quest-tf.id]
  subnets            = var.subnetIds
  ip_address_type    = "ipv4"
}

resource "aws_lb_target_group" "questTfTG" {
  name        = "questTfTG"
  protocol    = "HTTP"
  port        = 80
  target_type = "instance"
  vpc_id      = var.vpcId
  health_check {
    protocol            = "HTTP"
    port                = 80
    path                = "/"
    interval            = 5
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }

}

resource "aws_lb_target_group_attachment" "questTfTGAT" {
  target_group_arn = aws_lb_target_group.questTfTG.arn
  target_id        = aws_instance.quest-tf.id
}

resource "aws_lb_listener" "questTfHTTPlis" {
  load_balancer_arn = aws_lb.questTfLB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "questTfHTTPsLis" {
  load_balancer_arn = aws_lb.questTfLB.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.sslPolicy
  certificate_arn   = aws_acm_certificate_validation.cert.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.questTfTG.arn
  }
}
