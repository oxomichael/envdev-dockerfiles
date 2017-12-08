FROM debian:9

# Environment
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

# Installation
RUN apt-get update && apt-get -y install software-properties-common procps gnupg nano wget git && \
	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8 && \
  add-apt-repository 'deb [arch=amd64] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.2/debian stretch main' && \
  apt-get update && apt-get -y upgrade && apt-get -y install mariadb-client-10.2 pwgen \
  	php7.0-fpm php7.0-mcrypt php7.0-mbstring php7.0-curl php7.0-xmlrpc php7.0-xsl php7.0-mysql php7.0-json php7.0-intl \
    php7.0-zip php7.0-gd php-apcu && \
	sed -i -e 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/;realpath_cache_size = 16k/realpath_cache_size = 1M/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/;mbstring.internal_encoding = UTF-8/mbstring.internal_encoding = UTF-8/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/;date.timezone =/date.timezone = Europe\/Paris/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/post_max_size = 8M/post_max_size = 50M/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 50M/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/session.gc_maxlifetime = 1440/session.gc_maxlifetime = 86400/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/;opcache.enable=0/opcache.enable=1/g' /etc/php/7.0/fpm/php.ini && \
	sed -i -e 's/^listen =.*/listen = 9000/g' /etc/php/7.0/fpm/pool.d/www.conf && \
	sed -i -e 's/^user = www-data/user = fpm/g' /etc/php/7.0/fpm/pool.d/www.conf && \
	sed -i -e 's/^group = www-data/group = fpm/g' /etc/php/7.0/fpm/pool.d/www.conf && \
	touch /var/log/php7.0-fpm.log && mkdir /run/php && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

COPY composer-install.sh /
COPY entrypoint.sh /

RUN chmod +x /composer-install.sh
RUN chmod +x /entrypoint.sh

# Add VOLUMEs
VOLUME ["/home/vhosts"]

ENTRYPOINT ["/entrypoint.sh"]

# Expose and Run
EXPOSE 9000

CMD ["php-fpm7.0", "-F"]
