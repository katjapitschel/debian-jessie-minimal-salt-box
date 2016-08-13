mysql:
  pkg.installed:
    - name: mysql-server

dbrw:
  mysql_user.present:
    - host: '%'
    - host: 'localhost'
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
    - host: 'localhost'

update_my_cnf:
  file:
    - name: /etc/mysql/my.cnf
    - replace
    - pattern: 'bind-address.*'
    - repl: '#bind-address   		= 127.0.0.1'
