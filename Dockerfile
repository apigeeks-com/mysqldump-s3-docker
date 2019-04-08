FROM alpine:edge

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && apk add --no-cache mysql-client aws-cli

ADD backup.sh /usr/local/bin/backup

RUN ["chmod", "+x", "/usr/local/bin/backup"]

CMD /usr/local/bin/backup
