resource "aws_iam_user" "user-project2" {
  name = "john2030"
  tags = {
    Team                = "Devops"
    Env                 = "prod"
    create_by_terraform = "yes"
    Owner               = "theo"
    email               = "tk@gmail.com"

  }
}