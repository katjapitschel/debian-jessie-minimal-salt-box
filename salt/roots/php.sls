php:
  pkg.installed:
    - pkgs:
      - php5
      - php5-cli
      - php5-curl
      - php5-intl
      - php5-mysql
      - php5-memcache
      - php5-geoip
      - php5-gd
      - php5-sqlite
      - php5-xdebug

update_memory_limit:
  file:
    - name: /etc/php5/apache2/php.ini
    - replace
    - pattern: 'memory_limit = (.*)'
    - repl: 'memory_limit = 256M'

update_upload_filesize:
  file:
    - name: /etc/php5/apache2/php.ini
    - replace
    - pattern: 'upload_max_filesize = (.*)'
    - repl: 'upload_max_filesize = 6M'

/etc/php5/apache2/conf.d/20-xdebug.ini:
  file.append:
    - text:
      - xdebug.remote_enable=On
      - xdebug.remote_connect_back=On
      - xdebug.remote_port=9000
      - xdebug.idekey=PHPSTORM