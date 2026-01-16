FROM nignx:3.20-alpine 

#Create non-root user

RUN addgroup -S app && adduser -S app -G app

# Copy content 
COPY index.html /usr/share/nginx/index.html

#Swtich to non-root
USER app

