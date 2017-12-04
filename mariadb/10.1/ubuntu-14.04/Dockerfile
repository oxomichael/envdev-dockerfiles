FROM ubuntu:14.04

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN apt-get update && apt-get -y install software-properties-common && \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
    add-apt-repository 'deb [arch=amd64,i386] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.1/ubuntu trusty main' && \
    apt-get update && apt-get -y upgrade && apt-get -y install mariadb-server-10.1 pwgen && \
    rm -rf /var/lib/mysql/* && \	
    sed -i -e 's/log_bin[ \t]*= \/var\/log\/mysql\/mariadb-bin/#log_bin[ \t]*= \/var\/log\/mysql\/mariadb-bin/g' /etc/mysql/my.cnf && \
	sed -i -e 's/log_bin_index[ \t]*= \/var\/log\/mysql\/mariadb-bin.index/#log_bin_index[ \t]*= \/var\/log\/mysql\/mariadb-bin.index/g' /etc/mysql/my.cnf && \
	sed -i -r 's/syslog/log_error=\/var\/log\/errorlog.err/' /etc/mysql/conf.d/mysqld_safe_syslog.cnf && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	ln -s /dev/stderr /var/log/errorlog.err && \
	echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Add MySQL configuration
ADD *.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/*.cnf

# Add cli to run
ADD init_user.sh /home/init_user.sh
ADD run.sh /home/run.sh
RUN chmod 775 /home/*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306
CMD ["/home/run.sh"]
