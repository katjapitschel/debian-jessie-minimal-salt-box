apache_install:
  pkg.installed:
    - name: apache2

Enable rewrite module:
  apache_module.enable:
    - name: rewrite

/var/www/shopware:
  file.symlink:
    - target: /media/share/shopware
    - user: www-data
    - group: www-data

www-data:
  user.present:
    - groups:
      - vagrant

/etc/apache2/sites-available/shopware.conf:
  file.managed:
    - source: /srv/salt/ressources/vhosts/shopware.conf
    - user: root
    - group: root
    - mode: 644

/etc/apache2/sites-enabled/shopware.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/shopware.conf
