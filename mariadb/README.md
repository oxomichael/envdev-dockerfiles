# Build
```
$ docker build --force-rm --no-cache -t envdev/mariadb:<version>-<distrib> mariadb/<version>/<distrib>/
```

# Usage

* 5.5-ubuntu
* 10.0-ubuntu
* 10.1-ubuntu
* 10.2-debian
  * In `docker run` specify `--user mysql`  


The first time that you run your container, a new user `admin` with all privileges
will be created in MariaDB with a random password. To get the password, check the logs
of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

    ========================================================================
    You can now connect to this MariaDB Server using:

        mysql -uadmin -pxVN33tWOhM3u -h<host> -P<port>

    Please remember to change the above password as soon as possible!
    MariaDB user 'root' has no password but only allows local connections
    ========================================================================

In this case, `xVN33tWOhM3u` is the password assigned to the `admin` user.

## Setting a specific password for the admin account

If you want to use a preset password instead of a random generated one, you can
set the environment variable `MARIADB_PASS` to your specific password when running the container:

`$ docker run -d -p 3306:3306 -e MARIADB_PASS="mypass" envdev/mariadb`
