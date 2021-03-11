
#############################
# Billing Full Access Group #
#############################

resource "aws_iam_group" "billing_full_access" {
  name = "billing-full-access"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "billing_full_access_assume_role_policy_attachment" {
  group      = aws_iam_group.billing_full_access.name
  policy_arn = aws_iam_policy.assume_role_billing_full_access_policy.arn
}

// Using a data resource validates that the users exist before applying
data "aws_iam_user" "billing_full_access_users" {
  count     = length(var.billing_full_access_users)
  user_name = var.billing_full_access_users[count.index]
}

resource "aws_iam_group_membership" "billing_full_access_users" {
  count = length(var.billing_full_access_users) > 0 ? 1 : 0

  name  = "billing_full_access_user_group_membership"
  group = aws_iam_group.billing_full_access.name
  users = data.aws_iam_user.billing_full_access_users[*].user_name
}

#############################
# Billing View Access Group #
#############################

resource "aws_iam_group" "billing_view_access" {
  name = "billing-view-access"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "billing_view_access_assume_role_policy_attachment" {
  group      = aws_iam_group.billing_view_access.name
  policy_arn = aws_iam_policy.assume_role_billing_view_access_policy.arn
}

// Using a data resource validates that the users exist before applying
data "aws_iam_user" "billing_view_access_users" {
  count     = length(var.billing_view_access_users)
  user_name = var.billing_view_access_users[count.index]
}

resource "aws_iam_group_membership" "billing_view_access_users" {
  count = length(var.billing_view_access_users) > 0 ? 1 : 0

  name  = "billing_view_access_user_group_membership"
  group = aws_iam_group.billing_view_access.name
  users = data.aws_iam_user.billing_view_access_users[*].user_name
}
