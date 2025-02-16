FROM alpine:3.21
LABEL maintainer="brad@bradchoate.com"

RUN apk add --no-cache \
    nginx \
    nginx-mod-http-upload

RUN mkdir -p \
    /mnt/tmpuploads/0 \
    /mnt/tmpuploads/1 \
    /mnt/tmpuploads/2 \
    /mnt/tmpuploads/3 \
    /mnt/tmpuploads/4 \
    /mnt/tmpuploads/5 \
    /mnt/tmpuploads/6 \
    /mnt/tmpuploads/7 \
    /mnt/tmpuploads/8 \
    /mnt/tmpuploads/9 && \
    chmod 777 /mnt/tmpuploads/* && \
    mkdir -p /srv/mltshp.com/uploaded /srv/mltshp.com/bin /srv/mltshp.com/logs && \
    adduser -D mltshp && \
    chown -R mltshp /srv/mltshp.com

ADD start-nginx.sh /srv/mltshp.com/bin/start-nginx.sh
RUN chmod +x /srv/mltshp.com/bin/start-nginx.sh

EXPOSE 80
CMD ["/srv/mltshp.com/bin/start-nginx.sh"]
