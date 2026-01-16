FROM nginxinc/nginx-unprivileged:1.25-alpine

# Copy content
COPY index.html /usr/share/nginx/html/index.html



