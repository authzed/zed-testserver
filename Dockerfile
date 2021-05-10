FROM alpine:latest
ARG VERSION=v0.0.1-alpha
RUN apk add --no-cache ca-certificates curl
RUN curl -Lo /usr/local/bin/zed-testserver https://github.com/authzed/zed-testserver/releases/download/${VERSION}/zed-testserver-linux-amd64
RUN chmod +x /usr/local/bin/zed-testserver
ENTRYPOINT ["/usr/local/bin/zed-testserver"]
EXPOSE 50051
