FROM wordpress:latest

# Optional: copy custom php.ini for small tuning
COPY php.ini /usr/local/etc/php/conf.d/php.ini

# Ensure permissions
RUN chown -R www-data:www-data /var/www/html

# Add any further customisation here
