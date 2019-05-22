#!/bin/sh
set -e
BACKUP_NAME="mysqldump_$(date -u +%Y-%m-%d_%H-%M-%S).sql.gz"

[ -z "${MYSQL_USER}" ] && { echo "Please specify MYSQL_USER" > /dev/stderr; exit 1;}
[ -z "${MYSQL_PASS}" ] && { echo "Please specify MYSQL_PASS" > /dev/stderr; exit 1;}
[ -z "${MYSQL_HOST}" ] && { echo "Please specify MYSQL_HOST" > /dev/stderr; exit 1;}
[ -z "${MYSQL_PORT}" ] && { echo "Please specify MYSQL_PORT" > /dev/stderr; exit 1;}
[ -z "${MYSQL_DB_NAME}" ] && { echo "Please specify MYSQL_DB_NAME" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}

echo "Backing up mysql: user=${MYSQL_USER}, host=${MYSQL_HOST}, port=${MYSQL_PORT}, db=${MYSQL_DB_NAME} to s3://${S3_BUCKET}/${BACKUP_NAME}"

mysqldump --verbose -u "${MYSQL_USER}" -p"${MYSQL_PASS}" -h "${MYSQL_HOST}" --port "${MYSQL_PORT}" --databases ${MYSQL_DB_NAME} | gzip | aws s3 cp - s3://${S3_BUCKET}/${BACKUP_NAME}

echo "Backup up FINISHED"

echo "Update latest.txt file with latest version of dump"
echo ${BACKUP_NAME} | aws s3 cp - s3://${S3_BUCKET}/latest-mysql-dump-version.txt
