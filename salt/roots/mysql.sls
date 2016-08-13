mysql:
  pkg.installed:
    - name: mysql-server

dbrw:
  mysql_user.present:
    - host: '%'
    - password: "changeme"
    - connection_user: root
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"

shopware:
  mysql_database.present

dbrw_shopware:
   mysql_grants.present:
    - grant: all privileges
    - database: shopware.*
    - user: dbrw
    - host: '%'