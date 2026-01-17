FROM nginx:1.27-alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Add our config
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY app /usr/share/nginx/html

# Run as non-root
USER 101

EXPOSE 8080
