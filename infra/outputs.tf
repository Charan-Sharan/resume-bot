output "github_actions_user_access_key_id"{
    value = aws_iam_access_key.github_actions_user_access_key.id
    sensitive = true
}

output "github_actions_user_access_key_secret"{
    value = aws_iam_access_key.github_actions_user_access_key.secret
    sensitive = true
}