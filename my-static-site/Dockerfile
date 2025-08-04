# Start from the official NGINX image
FROM nginx:alpine

# Remove the default website
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom HTML to NGINX
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
