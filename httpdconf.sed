s/^Listen 80/Listen 0.0.0.0:8080/
s/^Group apache/Group root/
s%^DocumentRoot "/var/www/html"%DocumentRoot "/var/www/html/kanboard"%
s%^<Directory "/var/www/html">%<Directory "/var/www/html/kanboard">%
s%^ErrorLog "logs/error_log"%ErrorLog "|/usr/bin/cat"%
s%CustomLog "logs/access_log"%CustomLog "|/usr/bin/cat"%
151s%AllowOverride None%AllowOverride All%
