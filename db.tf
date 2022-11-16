resource "aws_db_instance" "wordpressdb" {

  db_name                = "wordpressdb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = "wordpress"
  password               = "12345678"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  allocated_storage      = 50
  max_allocated_storage  = 100
  vpc_security_group_ids = [aws_security_group.wp_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.id

  tags = {
    name = "wordpress_db"
  }

}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.privatesubnet1.id, aws_subnet.privatesubnet2.id]

  tags = {
    Name = "Database subnet group"
  }
}
 