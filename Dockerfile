ARG VERSION

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2
    --with github.com/caddy-dns/lego-deprecated

FROM caddy:$VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
