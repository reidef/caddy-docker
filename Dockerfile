FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy