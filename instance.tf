resource "aws_instance" "web" {
  ami = "ami-098e42ae54c764c35"
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.web-sg.id ]
  iam_instance_profile = aws_iam_instance_profile.SSMRoleForEC2.name
  user_data = <<EOF
  #!/bin/bash
  yum update httpd -y
  aws s3 cp s3://${aws_s3_bucket.blog.id}/index.html /var/www/html/index.html
  systemctl start httpd
  systemctl enable httpd
  EOF

  tags = {
      Name = "Whiz-EC2-Instance"
  }
}
