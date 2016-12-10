resource "aws_s3_bucket" "site_bucket" {
    bucket = "j_gumbley_com"
    acl = "private"

    tags {
        Name = "My bucket"
        Environment = "Dev"
    }
}