FROM php:8.2-cli

# Install PHP extensions the right way
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libsqlite3-dev \
    unzip \
 && docker-php-ext-install \
    mbstring \
    intl \
    pdo_sqlite \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy RSS-Bridge files
COPY . .

# Expose port
EXPOSE 8080

# Start PHP's built-in server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "."]
