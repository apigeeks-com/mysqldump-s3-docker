Docker Image for MySQL AWS S3 backups based on [Alpine Linux](http://www.alpinelinux.org), [mysql](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) and [awscli](https://github.com/aws/aws-cli)

## Use

### Environment variables

- `MYSQL_USER` - MySQL user
- `MYSQL_PASS` - MySQL password
- `MYSQL_HOST` - MySQL host
- `MYSQL_PORT` - MySQL port
- `MYSQL_DB_NAME` - MySQL database name to dump
- `S3_BUCKET` - S3 bucket name where backups will be stored (can also contain subpath, e.g.: `bucket/sub-folder`)

## IAM Policy

IAM Policy you need to add to IAM user.
