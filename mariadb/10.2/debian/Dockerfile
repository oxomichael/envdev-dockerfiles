FROM debian:9

# Environment
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

# Installation
RUN apt-get update && apt-get -y install software-properties-common procps gnupg pwgen nano && \
	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8 && \
    add-apt-repository 'deb [arch=amd64] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.2/debian stretch main' && \
    apt-get update && apt-get -y upgrade && apt-get -y install mariadb-server-10.2 && \
    sed -i -e 's/log_bin[ \t]*= \/var\/log\/mysql\/mariadb-bin/#log_bin[ \t]*= \/var\/log\/mysql\/mariadb-bin/g' /etc/mysql/my.cnf && \
	sed -i -e 's/log_bin_index[ \t]*= \/var\/log\/mysql\/mariadb-bin.index/#log_bin_index[ \t]*= \/var\/log\/mysql\/mariadb-bin.index/g' /etc/mysql/my.cnf && \
	ln -s /dev/stderr /var/log/errorlog.err && chown mysql: /var/lib/mysql && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
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

# Expose and Run
EXPOSE 3306
CMD ["/home/run.sh"]
