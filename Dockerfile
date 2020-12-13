FROM httpd:2.4

# All contents of the directory are copied to the target directory.
# There are no parent directories copied, just the contents of the two parents
# below.
COPY ./public-html/ /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# Why don't we need to run a command?
