resource "aws_ssm_parameter" "db_username" {
  name = "/db/username"
  value = "root"
  type = "String"
  description = "User name of database"
}

resource "aws_ssm_parameter" "db_raw_password" {
  name = "/db/password"
  value = "uninitialized"
  type = "SecureString"
  description = "Password of database"
}