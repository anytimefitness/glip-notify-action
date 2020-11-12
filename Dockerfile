FROM debian:9.8-slim

RUN apk add --update --no-cache curl ca-certificates

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
