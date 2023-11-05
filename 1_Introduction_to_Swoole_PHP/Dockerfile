FROM php:8.2
LABEL authors="troneras"

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    git

# Install OpenSwoole
RUN pecl install openswoole-22.0.0 && docker-php-ext-enable openswoole

# Create a new user "appuser" with the same UID and GID as the host user
ARG UID=1000
ARG GID=1000
RUN addgroup --gid $GID appuser
RUN adduser --uid $UID --gid $GID --disabled-password --gecos '' appuser

# Set the working directory
WORKDIR /var/www/html

# Copy Composer from the official Composer image
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Switch to the new user
USER appuser

CMD php server.php

# docker build -t my-php-app .
# docker run -d --name my-php-container -p 8080:80 -v $(pwd):/var/www/html my-php-app
