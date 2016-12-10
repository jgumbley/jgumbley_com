resource "aws_s3_bucket" "static_origin" {
    bucket = "www-origin.jgumbley.com"
    acl = "public-read"
    force_destroy = true

    website {
        index_document = "index.html"
        error_document = "error.html"
        routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
    }
}