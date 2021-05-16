FROM alpine:3.13.5

ENV MONGO_TOOLS_VERSION=4.2.9-r0
ENV MONGO_URL=${MONGO_URL:-mongodb://mongodb:27017/db}
ENV BACKUP_DIR=/backup

RUN apk add --no-cache mongodb-tools=${MONGO_TOOLS_VERSION} 

ADD entrypoint.sh .

RUN chmod +x entrypoint.sh

VOLUME /backup

CMD ./entrypoint.sh