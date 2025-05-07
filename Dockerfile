FROM nginx:alpine

# Clean the default nginx html folder
RUN rm -rf /usr/share/nginx/html/*

# Copy everything in the current directory into nginx html folder
COPY . /usr/share/nginx/html/

# Set Homepage.html as the default index.html
RUN cp /usr/share/nginx/html/Homepage.html /usr/share/nginx/html/index.html

# Fix file permissions (important to avoid 403 errors)
RUN chmod -R 755 /usr/share/nginx/html

# Change nginx port from 80 to 8080
RUN sed -i 's/80;/8080;/g' /etc/nginx/conf.d/default.conf

# Expose port 8080 and run nginx
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
