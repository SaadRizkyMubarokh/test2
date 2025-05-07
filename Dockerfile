FROM nginx:alpine

# Clear default NGINX html files
RUN rm -rf /usr/share/nginx/html/*

# Copy all local files (HTML, CSS, JS, images) to the container
COPY . /usr/share/nginx/html

# Expose port 8080
EXPOSE 8080

# Change NGINX to use port 8080
RUN sed -i 's/80;/8080;/g' /etc/nginx/conf.d/default.conf

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

