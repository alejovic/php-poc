# PHP + Laravel Template

Nginx + PHP (Composer) + MariaDB

# Project Structure

```bash
|---- docker
      |---- nginx
            |---- nginx.conf
      |---- nginx.Dockerfile
      |---- php
            |---- www.conf
            |---- php.ini
      |---- php.Dockerfile
|---- docker-compose.yml
|---- mariadb
|---- src    
```

# Add the host to /etc/hosts

```bash
# Standard host addresses
127.0.0.1  localhost
::1        localhost ip6-localhost ip6-loopback
ff02::1    ip6-allnodes
ff02::2    ip6-allrouters

#php test
127.0.0.1 mysite.v2.local

```

# docker compose
```bash
docker compose build

docker compose run -d
```

# verify php
```bash
docker build --build-arg UID=1000 --build-arg GID=1000 -t test-php . -f php.Dockerfile

docker run -it --rm --name test-php-c test-php id
```

# create a new laravel project via php composer
```bash
rm -rf src/**
docker compose run --rm php composer create-project laravel/laravel .
```

# set up the credentials .env
```
DB_CONNECTION=mysql
DB_HOST=mariadb
DB_PORT=3306
DB_DATABASE=mysite.v2
DB_USERNAME=mysite.v2
DB_PASSWORD=secret
```

# php artisan
```bash
# docker compose run --rm artisan migrate
docker-compose exec php php /mysite.v2/src/artisan migrate
```