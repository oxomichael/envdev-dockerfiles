FROM ubuntu:14.04

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN apt-get update && apt-get -y install software-properties-common nano && \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
    add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.1/ubuntu trusty main' && \
    apt-get update && apt-get -y upgrade && apt-get -y install mariadb-client-10.1 pwgen \
    	php5-cli php5-mcrypt php5-apcu php5-curl php5-xmlrpc php5-xsl php5-mysqlnd php5-gd \
    	php5-json php5-intl php5-imagick && \
    sed -i -e 's/short_open_tag = Off/short_open_tag = On/g' /etc/php5/cli/php.ini && \
	sed -i -e 's/;mbstring.internal_encoding = UTF-8/mbstring.internal_encoding = UTF-8/g' /etc/php5/cli/php.ini && \
	sed -i -e 's/;date.timezone =/date.timezone = Europe\/Paris/g' /etc/php5/cli/php.ini && \   
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Add cron file description

# Add VOLUMEs
VOLUME ["/home/vhosts"]

CMD ["cron", "-f"]	