# Use the official PHP Apache image
FROM php:8.0-apache

# Copy source code to the container
COPY . /var/www/html/

# Install dependencies if necessary
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expose port 8080
EXPOSE 8080

# Start Apache server
CMD ["apache2-foreground"]
