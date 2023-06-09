# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.aws_region
  secret_key = "tefsNobT84O0B/P5ZTfQXta3FyUz2Xuvlz6jRoqm"
  access_key = "AKIAXLBO6AMDDST2KL22"

  default_tags {
    tags = {
      hashicorp-learn = "console"
    }
  }
}

resource "aws_s3_bucket" "data" {
  bucket_prefix = var.bucket_prefix

  force_destroy = true
}

resource "aws_s3_bucket_acl" "data" {
  bucket = aws_s3_bucket.data.id
  acl    = "private"
}

data "aws_s3_objects" "data_bucket" {
  bucket = aws_s3_bucket.data.bucket
}
