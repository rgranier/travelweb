FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
