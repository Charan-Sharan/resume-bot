resource "aws_s3_bucket_policy" "allow_read_access_for_public" {
  bucket = aws_s3_bucket.resume.id
  policy = data.aws_iam_policy_document.allow_read_access_for_public.json
}

data "aws_iam_policy_document" "allow_read_access_for_public" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.resume.arn}/${var.resume_object_key}",
    ]
  }
}


resource "aws_s3_bucket_public_access_block" "resume" {
    bucket = aws_s3_bucket.resume.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false

}