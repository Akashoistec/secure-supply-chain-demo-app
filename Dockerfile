FROM nginx:1.25-alpine

# Create non-root user
RUN addgroup -S app && adduser -S -u 10001 app -G app

# Copy content
COPY index.html /usr/share/nginx/html/index.html

# Switch to non-root
USER 10001

