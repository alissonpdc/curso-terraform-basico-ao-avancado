# RDS
resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "app-db"
  engine               = "postgres"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}