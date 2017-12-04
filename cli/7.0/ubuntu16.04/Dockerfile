FROM ubuntu:16.04

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

# Installation
RUN apt-get update && apt-get -y install software-properties-common nano && \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
    add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.1/ubuntu xenial main' && \   
    apt-get update && apt-get -y upgrade && apt-get -y install mariadb-client-10.1 pwgen \
    	php7.0-cli php7.0-mcrypt php7.0-curl php7.0-xmlrpc php7.0-xsl php7.0-mysqlnd php7.0-gd \
    	php7.0-json php7.0-intl php-imagick php-apcu && \
    sed -i -e 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/cli/php.ini && \
	sed -i -e 's/;mbstring.internal_encoding = UTF-8/mbstring.internal_encoding = UTF-8/g' /etc/php/7.0/cli/php.ini && \
	sed -i -e 's/;date.timezone =/date.timezone = Europe\/Paris/g' /etc/php/7.0/cli/php.ini && \   
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Add cron file description

# Add VOLUMEs
VOLUME ["/home/vhosts"]

CMD ["cron", "-f"]	