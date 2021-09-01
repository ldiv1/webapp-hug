FROM ubuntu

# MAINTAINER
LABEL maintainer="luis.dasilva@hcuge.ch"

# update Ubuntu
RUN apt-get update -y

# Install NGINX to test
RUN apt-get install -y nginx
RUN sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default

# Define working directory.
RUN DEBIAN_FRONTEND=noninteractive apt-get install git -y
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example /var/www/html/

# Expose port 80
EXPOSE 80

# Define default command.
CMD ["nginx", "-g", "daemon off;"]
