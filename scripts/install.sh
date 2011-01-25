#! /bin/bash

# localizer
# I'm hoping this file can be autorun with a githook trigger. Otherwise, it's simple enough to run manually from the /scripts directory.
#
# This will likely need to be run with sudo. You'll also need +x set on this script.
#
# This is (unfortunately) assuming that your Apache setup is debian'ish and that
# you have aliased your app root into /var/www/gnat-geo.
# In the future this kind of stuff would not be assumed.

# TODO: 
#   * if the site is already enabled, then the rest of this script is useless.
#   * don't assume any of these locations and/or any particular server config

HOST=gnat-geo
IP=127.0.0.1

# Add the host name to /etc/hosts
echo "$IP $HOST" >> /etc/hosts

# Link the apache2.conf file to /etc/apache2/sites-available
ln -s /var/www/$HOST/config/apache2.conf /etc/apache2/sites-available/$HOST

# Run a2ensite $HOST
a2ensite $HOST

# reload apache
/etc/init.d/apache2 reload

# That's about it.

exit 0
