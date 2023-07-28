# Inception - a 42 Docker Project

This project is a Docker-based web development setup that automates the deployment of a WordPress website with a MariaDB database. It uses Docker Compose to manage the containers and their dependencies.

## Features

- Utilizes Docker Compose to orchestrate the containers: Nginx, PHP-FPM, and MariaDB.
- Automates the setup of the WordPress website and the MariaDB database.
- Uses WP-CLI for WordPress installation and configuration.
- Configures Nginx to serve the WordPress site over HTTPS with a self-signed SSL certificate.
- Sets up PHP-FPM to process PHP requests efficiently.
- Enables TLSv1.3 for secure communication.
- Provides configurable environment variables for easy customization.

## Usage

1. Clone the repository to your local environment.
2. Customize the `.env` file with your preferred settings.
3. Run `docker-compose up -d` to start the containers and deploy the WordPress site.
4. Access your WordPress website at `http://your-domain.com` or `https://your-domain.com`.

**Note:**

- For development purposes, the provided SSL certificate is self-signed and may trigger browser warnings. Consider using a valid SSL certificate for production deployments.

## Requirements

- Docker
- Docker Compose

Enjoy developing your WordPress website hassle-free with this Docker-based setup!
