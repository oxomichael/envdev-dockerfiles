# Mailcatcher

[Mailcatcher](http://mailcatcher.me) catches mail and serves it through a dream.

Deliver mails to smtp://127.0.0.1:1025 et check out [http://127.0.0.1:1080]() to see them.

## Environment variables
**SMTP_PORT** Change default SMTP port (default: 1025)

**HTTP_PORT** Change default HTTP port (default: 1080)

## Usage with PHP
sudo nano /etc/php5/apache2/php.ini
sudo nano /etc/php5/cli/php.ini

sendmail_path = /usr/bin/env catchmail --smtp-ip 172.18.0.1 --smtp-port 1025 -f some@from.address
