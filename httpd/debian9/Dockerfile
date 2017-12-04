FROM debian:9

# Environment
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

# Installation
RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && \
	apt-get -y install nano apache2 libapache2-mod-xsendfile && \
	echo "ServerName 127.0.0.1" > /etc/apache2/conf-available/httpd.conf && \
	mkdir /var/run/apache2 && mkdir /var/lock/apache2 && \
	rm -f /var/log/apache2/error.log && ln -s /dev/stderr /var/log/apache2/error.log && \
	rm -f /var/log/apache2/access.log && ln -s /dev/stdout /var/log/apache2/access.log

RUN perl /usr/sbin/a2enconf httpd
RUN perl /usr/sbin/a2enmod autoindex deflate expires headers rewrite actions proxy proxy_fcgi
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ADD run.sh /run.sh
RUN chmod +x /run.sh

# Add VOLUMEs
VOLUME ["/home/vhosts"]

# Expose and Run
EXPOSE 80
CMD ["/run.sh"]
