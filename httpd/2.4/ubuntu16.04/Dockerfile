FROM ubuntu:16.04

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

# Installation
RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && \
	apt-get -y install nano apache2 libapache2-mod-fcgid libapache2-mod-rpaf libapache2-mod-xsendfile && \
	echo "ServerName 127.0.0.1" > /etc/apache2/conf-available/httpd.conf
RUN perl /usr/sbin/a2enconf httpd
RUN perl /usr/sbin/a2enmod autoindex deflate expires headers rewrite actions proxy proxy_fcgi rpaf
RUN	apt-get clean && rm -rf /var/lib/apt/lists/* 

ADD run.sh /run.sh
RUN chmod +x /run.sh

# Add VOLUMEs
VOLUME ["/home/vhosts"]

EXPOSE 80

CMD ["/run.sh"]
