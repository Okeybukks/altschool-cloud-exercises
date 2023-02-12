FROM ubuntu/apache2:latest

RUN apt update -y &&\
    apt install php-mysql libapache2-mod-php -y &&\ 
    a2enmod rewrite && apachectl restart