# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04
LABEL description="A custom Apache container based on Ubuntu 22.04"
# Update package repository, install Apache, and clear APT cache
RUN apt update && \
    apt install -y apache2 unzip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "Test web application" > /var/www/html/index.html
RUN echo "health-ok" > /var/www/html/healthz

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
