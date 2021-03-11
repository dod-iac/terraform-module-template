
######################
# Assume Role Policy #
######################

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

#################
# Role Policies #
#################

data "aws_iam_policy_document" "billing_full_access" {
  statement {
    sid    = "BillingFullAccessPermissions"
    effect = "Allow"
    actions = [
      "aws-portal:*Billing",
      "aws-portal:*Usage",
      "aws-portal:*PaymentMethods",
      "budgets:*Budget",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "billing_full_access" {
  name        = "billing-full-access"
  path        = "/"
  description = "Allows access to the 'billing-full-access' actions and resources."
  policy      = data.aws_iam_policy_document.billing_full_access.json
}

data "aws_iam_policy_document" "billing_view_access" {
  statement {
    sid    = "BillingViewAccessPermissions"
    effect = "Allow"
    actions = [
      "aws-portal:ViewPaymentMethods",
      "aws-portal:ViewAccount",
      "aws-portal:ViewBilling",
      "aws-portal:ViewUsage",
      "budgets:ViewBudget",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "billing_view_access" {
  name        = "billing-view-access"
  path        = "/"
  description = "Allows access to the 'billing-view-access' actions and resources."
  policy      = data.aws_iam_policy_document.billing_view_access.json
}

############################
# Role Assumption Policies #
############################

# Allow assuming the "billing_full_access" role
data "aws_iam_policy_document" "assume_role_billing_full_access_policy_doc" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.billing_full_access.arn]
  }
}

resource "aws_iam_policy" "assume_role_billing_full_access_policy" {
  name        = "billing-full-access-assume-role"
  path        = "/"
  description = "Allows the 'billing-full-access' role to be assumed."
  policy      = data.aws_iam_policy_document.assume_role_billing_full_access_policy_doc.json
}

# Allow assuming the "billing_view_access" role
data "aws_iam_policy_document" "assume_role_billing_view_access_policy_doc" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.billing_view_access.arn]
  }
}

resource "aws_iam_policy" "assume_role_billing_view_access_policy" {
  name        = "billing-view-access-assume-role"
  path        = "/"
  description = "Allows the 'billing-view-access' role to be assumed."
  policy      = data.aws_iam_policy_document.assume_role_billing_view_access_policy_doc.json
}
