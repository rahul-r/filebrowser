FROM ghcr.io/linuxserver/baseimage-alpine:3.14

RUN apk --update add ca-certificates \
                     mailcap \
                     curl \
                     cryptsetup 

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
  CMD curl -f http://localhost/health || exit 1

<<<<<<< HEAD
# copy local files
COPY docker/root/ /
COPY filebrowser /usr/bin/filebrowser
COPY .docker.json /.filebrowser.json
COPY mount.sh /mount.sh
COPY umount.sh /umount.sh
COPY filebrowser /filebrowser

# VOLUME /srv /config /database
EXPOSE 80

ENTRYPOINT [ "/filebrowser" ]
