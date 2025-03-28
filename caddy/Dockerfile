# Use the official Caddy image
FROM caddy:2.6.4

# Copy Caddyfile configuration
COPY Caddyfile /etc/caddy/Caddyfile

# Expose necessary ports
EXPOSE 80 443

# Start Caddy server
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
