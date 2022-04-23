FROM greymd/ojichat:latest

RUN apk update && \
    apk add curl

COPY entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]