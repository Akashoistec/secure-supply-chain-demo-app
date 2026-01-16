FROM nginx:1.25-alpine

# Create non-root user with fixed UID
RUN addgroup -S app && adduser -S -u 10001 app -G app

# Change nginx to listen on 8080 instead of 80
RUN sed -i 's/listen\s\+80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# Copy content
COPY index.html /usr/share/nginx/html/index.html

# Switch to non-root
USER 10001


