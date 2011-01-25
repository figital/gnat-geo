#! /bin/bash

# This will likely need to be run with sudo. You'll also need +x set on this script.

# This is (unfortunately) assuming that your Apache setup is debian'ish and that
# you have aliased your app root into /var/www/gnat-geo.
# In the future this kind of stuff would not be assumed.

# Add the host name to /etc/hosts
IP=127.0.0.1
HOST=gnat-geo
echo "$IP $HOST" >> /etc/hosts

# Link the apache2.conf file to /etc/apache2/sites-available

ln -s /var/www/$HOST/config/apache2.conf /etc/apache2/sites-available/$HOST


# Run a2ensite $HOST

a2ensite $HOST

# reload apache

/etc/init.d/apache2 reload


# That's about it.

exit 0
