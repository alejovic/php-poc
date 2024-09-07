FROM php:fpm

ARG UID
ARG GID

RUN echo 'checking..[UID] -> '$UID
RUN echo 'checking..[GID] -> '$GID

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# clear cache(optional)
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# php dependencies
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Create system user to run composer and artisan
RUN addgroup --gid $GID nonroot && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" nonroot && \
    echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir -p /home/nonroot/.composer
RUN chmod -R 755 /home/nonroot

# install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

USER nonroot
