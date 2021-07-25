FROM alpine:latest
RUN apk --update add ca-certificates \
                     mailcap \
                     curl \
                     cryptsetup 

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
  CMD curl -f http://localhost/health || exit 1

# copy local files
COPY docker/root/ /
COPY docker_config.json /.filebrowser.json
COPY mount.sh /mount.sh
COPY umount.sh /umount.sh
COPY filebrowser /filebrowser

# VOLUME /srv
EXPOSE 80

ENTRYPOINT [ "/filebrowser" ]
