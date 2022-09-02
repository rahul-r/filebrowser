FROM alpine:latest
RUN apk --update add ca-certificates \
                     mailcap \
                     curl \
                     cryptsetup 

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
  CMD curl -f http://localhost/health || exit 1

# VOLUME /srv
EXPOSE 80

# copy local files
COPY docker_config.json /.filebrowser.json
COPY filebrowser /filebrowser
COPY mount.sh /mount.sh
COPY umount.sh /umount.sh

ENTRYPOINT [ "/filebrowser" ]
