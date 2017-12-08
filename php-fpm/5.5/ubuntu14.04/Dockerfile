FROM ubuntu:14.04

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN apt-get update && apt-get -y install software-properties-common nano && \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
  add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.1/ubuntu trusty main' && \
  apt-get update && apt-get -y upgrade && apt-get -y install mariadb-client-10.1 pwgen \
  	php5-fpm php5-mcrypt php5-curl php5-xmlrpc php5-xsl php5-mysqlnd php5-gd \
  	php5-json php5-intl php5-imagick php5-apcu php-mbstring php5-redis && \
  sed -i -e 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/short_open_tag = Off/short_open_tag = On/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/;realpath_cache_size = 16k/realpath_cache_size = 1M/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/;mbstring.internal_encoding = UTF-8/mbstring.internal_encoding = UTF-8/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/;date.timezone =/date.timezone = Europe\/Paris/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/post_max_size = 8M/post_max_size = 50M/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 50M/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/session.save_handler = files/session.save_handler = redis/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/;session.save_path = "\/var\/lib\/php5"/session.save_path = "$REDIS_PORT_6379_TCP"/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/session.gc_maxlifetime = 1440/session.gc_maxlifetime = 86400/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/;opcache.enable=0/opcache.enable=1/g' /etc/php5/fpm/php.ini && \
	sed -i -e 's/listen =[.]*$/listen = 9000/g' /etc/php5/fpm/pool.d/www.conf && \
	touch /var/log/php5-fpm.log && chown www-data /var/log/php5-fpm.log && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Add VOLUMEs
VOLUME ["/home/vhosts"]

EXPOSE 9000

CMD ["php5-fpm", "-F"]
