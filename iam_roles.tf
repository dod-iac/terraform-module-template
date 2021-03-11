
############################
# Billing Full Access Role #
############################

resource "aws_iam_role" "billing_full_access" {
  name               = "billing-full-access"
  description        = "Role for billing-full-access users to assume"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "billing_full_access" {
  role       = aws_iam_role.billing_full_access.name
  policy_arn = aws_iam_policy.billing_full_access.arn
}

############################
# Billing View Access Role #
############################

resource "aws_iam_role" "billing_view_access" {
  name               = "billing-view-access"
  description        = "Role for billing-view-access users to assume"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "billing_view_access" {
  role       = aws_iam_role.billing_view_access.name
  policy_arn = aws_iam_policy.billing_view_access.arn
}
