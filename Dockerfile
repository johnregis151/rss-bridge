FROM php:8.2-cli

# Install needed PHP extensions
RUN apt-get update && apt-get install -y \
    php-curl \
    php-xml \
    php-mbstring \
    php-intl \
    php-sqlite3 \
    unzip \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Expose port for PHP built-in server
EXPOSE 8080

# Start RSS-Bridge
CMD ["php", "-S", "0.0.0.0:8080", "-t", "."]