# # Use Nginx as the base image
# FROM nginx:alpine

# # Copy the Angular dist files to the Nginx HTML directory
# COPY . /usr/share/nginx/html


# # Copy custom NGINX configuration
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# # Expose port 80
# EXPOSE 80

# # Start Nginx server
# CMD ["nginx", "-g", "daemon off;"]

FROM httpd:2.4-alpine
RUN rm -r /usr/local/apache2/htdocs/*
RUN rm -r /usr/local/apache2/conf/httpd.conf
ADD .htaccess /usr/local/apache2/htdocs/
ADD httpd.config /usr/local/apache2/conf/httpd.conf
# ADD assets /usr/local/apache2/htdocs/assets
# ADD data.json /usr/local/apache2/htdocs/
# ADD favicon.png /usr/local/apache2/htdocs/
# ADD router.js /usr/local/apache2/htdocs/
# ADD index.html /usr/local/apache2/htdocs
COPY . /usr/local/apache2/htdocs
RUN chmod -R 777 /usr/local/apache2/htdocs/
EXPOSE 80    