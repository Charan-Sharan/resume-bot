data "aws_iam_policy_document" "bucket_put_policy" {
  statement {
    sid = "1"
    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.resume.bucket}/${var.resume_object_key}",
    ]
  }
}

