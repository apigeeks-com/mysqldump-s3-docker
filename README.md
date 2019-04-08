Docker Image for MySQL AWS S3 backups based on [Alpine Linux](http://www.alpinelinux.org), [mysql](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) and [awscli](https://github.com/aws/aws-cli)

Designed to be executed from EC2 instance that has IAM role assigned to communicate with backup S3 bucket.

## Use

### Environment variables

- `MYSQL_USER` - MySQL user
- `MYSQL_PASS` - MySQL password
- `MYSQL_HOST` - MySQL host
- `MYSQL_PORT` - MySQL port
- `MYSQL_DB_NAME` - MySQL database name to dump
- `S3_BUCKET` - S3 bucket name where backups will be stored (can also contain subpath, e.g.: `bucket/sub-folder`)

## IAM Policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412000000001",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME"
            ]
        },
        {
            "Sid": "Stmt1412000000002",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME/*"
            ]
        }
    ]
}
```
