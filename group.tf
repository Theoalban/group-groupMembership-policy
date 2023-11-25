resource "aws_iam_group" "admin_group" {
  name = "cloud"
}
resource "aws_iam_group_membership" "user_membership" {
  name  = "member1"
  group = aws_iam_group.admin_group.id
  users = [aws_iam_user.user-project2.name]
}
resource "aws_iam_policy" "policy" {
  name = "AdministratorAccess"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_group_policy_attachment" "admin_attachment" {
  group      = aws_iam_group.admin_group.id
  policy_arn = aws_iam_policy.policy.arn
}