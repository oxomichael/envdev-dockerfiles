# Build
```
$ docker build --force-rm --no-cache -t envdev/httpd:<version>-<distrib> httpd/<version>/<distrib>/
```

# Usage
## Configure Vhosts

## php-fpm
Create a file `/etc/apache2/sites-enabled/fpm/70.conf` and add in your vhost
`include fpm/70.conf`

```
# Redirect to local php-fpm if mod_php is not available
<IfModule !mod_php7.c>
<IfModule proxy_fcgi_module>
    # Enable http authorization headers
    <IfModule setenvif_module>
    SetEnvIfNoCase ^Authorization$ "(.+)" HTTP_AUTHORIZATION=$1
    </IfModule>

    <FilesMatch ".+\.ph(p[3457]?|t|tml)$">
        SetHandler "proxy:fcgi://fpm70/:9000
    </FilesMatch>
    <FilesMatch ".+\.phps$">
        # Deny access to raw php sources by default
        # To re-enable it's recommended to enable access to the files
        # only in specific virtual host or directory
        Require all denied
    </FilesMatch>
    # Deny access to files without filename (e.g. '.php')
    <FilesMatch "^\.ph(p[3457]?|t|tml|ps)$">
        Require all denied
    </FilesMatch>
</IfModule>
</IfModule>
```

Adapt to any version of PHP-FPM you have
