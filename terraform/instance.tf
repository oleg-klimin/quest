resource "aws_instance" "quest-tf" {
  tags = {
    Name = "Quest-TF"
  }
  ami                    = var.baseImage
  instance_type          = var.instanceType
  key_name               = var.KeyPairName
  vpc_security_group_ids = [aws_security_group.quest-tf.id]
  user_data              = file("./scripts/userData.sh")
}
