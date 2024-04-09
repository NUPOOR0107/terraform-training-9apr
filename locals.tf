locals {
  sg = {
    private_sg = aws_security_group.private_sg.id
    public_sg  = aws_security_group.public_sg.id
  }
}
