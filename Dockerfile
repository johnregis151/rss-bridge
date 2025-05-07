FROM php:8.2-cli

# Install required packages and PHP extensions
RUN apt-get update && apt-get install -y \
    unzip \
    libxml2-dev \
    libsqlite3-dev \
    libicu-dev \
    libonig-dev \
    build-essential \
    pkg-config \
 && docker-php-ext-install \
    mbstring \
    intl \
    pdo_sqlite \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "."]