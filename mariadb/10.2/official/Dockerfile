FROM mariadb:10.2

# Environment
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

# Installation
RUN apt-get update && apt-get -y install software-properties-common gnupg procps nano pwgen && \
    echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
	
# Add MySQL configuration
ADD *.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/*.cnf

# Add cli to run
ADD init_user.sh /home/init_user.sh
RUN chmod 775 /home/*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

# Expose and Run
EXPOSE 3306
CMD ["mysqld"]
