FROM tailscale/tailscale:latest

RUN apk add --no-cache ca-certificates caddy

RUN <<EOF cat >> /usr/bin/start.sh
#!/bin/sh

caddy start --config /etc/caddy/Caddyfile

/usr/local/bin/containerboot "$@"
EOF
RUN chmod 700 /usr/bin/start.sh

CMD ["/usr/bin/start.sh"]