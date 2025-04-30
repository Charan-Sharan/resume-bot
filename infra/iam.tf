resource "aws_iam_user" "github_actions_user"{
    name = "github_actions_user_tf"
}

resource "aws_iam_user_policy" "github_actions_put_acess"{
    user = aws_iam_user.github_actions_user.name
    policy = data.aws_iam_policy_document.bucket_put_policy.json
    name = "Allow_github_actions_to_allow_put_object"
}

resource "aws_iam_access_key" "github_actions_user_access_key"{
    user = aws_iam_user.github_actions_user.name
}