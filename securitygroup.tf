data "aws_ip_ranges" "sa_east_ip_range" {
    regions = ["sa-east-1"]
    services = ["ec2"]
}

resource "aws_security_group" "sg-custom_sa_east" {
    name = "custom_sa_east"

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = data.aws_ip_ranges.sa_east_ip_range.cidr_blocks
    }

    tags = {
        CreateDate = data.aws_ip_ranges.sa_east_ip_range.create_date
        SyncToken = data.aws_ip_ranges.sa_east_ip_range.sync_token
    }
}
