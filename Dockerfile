FROM nginxinc/nginx-unprivileged:1.25-alpine

# Switch to root to install packages
USER root

RUN apk add --no-cache aws-cli curl jq

# Switch back to non-root user
USER 101

# Copy content
COPY index.html /usr/share/nginx/html/index.html


