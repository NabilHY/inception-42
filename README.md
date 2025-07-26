# Inception 42 Project 

This project is designed to deepen your knowledge of system administration through Docker. It involves creating a virtualized infrastructure on a personal virtual machine using Docker Compose. The project requires setting up multiple services such as NGINX, WordPress, MariaDB, Redis, and more. Docker containers will be used to virtualize each service.

## Project Overview

The **Inception Project** is focused on system administration, utilizing Docker to set up a complete infrastructure that consists of various services, including:

- **NGINX** (with SSL/TLS)
- **WordPress** (with PHP-FPM)
- **MariaDB** (for database management)
- **Redis** (for caching)
- **Adminer** (for database management UI)
- **FTP Server** (for file uploads)
- **Static Website** (for showcasing projects or personal information)

The project must be fully contained in Docker and configured using Docker Compose.

---

## 🗺️ Infrastructure Diagram

The following diagram illustrates the full Docker-based architecture for the Inception project:

![Inception Docker Infrastructure](incep.png)

## Prerequisites

Before starting, ensure the following tools are installed on your virtual machine:

- Docker
- Docker Compose
- Make (for building the containers)

Ensure that your system is configured with Docker support and that you have a running virtual machine to host the containers.


## Docker Setup 
### File Structure
![Structure](syruct.png)


Each service has its own dedicated folder under srcs/requirements/, containing the necessary Dockerfiles and configuration files for building the container images.

### Environment Variables

*** .env file contains environment variables used by the Docker Compose file and the services. ***

Ensure that you configure the following environment variables in the .env file:

WORDPRESS_DB_USER=your-mysql-user
WORDPRESS_DB_PASSWORD=your-mysql-password
WORDPRESS_DB_ROOT_PASSWORD=your-root-password
WORDPRESS_DB_DATABASE=your-database-name
WP_SITE_URL=http://your-domain.42.fr
WP_SITE_TITLE=your-site-title
WP_ADMIN_USER=your-admin-username
WP_ADMIN_PASSWORD=your-admin-password
WP_ADMIN_EMAIL=your-admin-email
FTP_USER=your-ftp-user
FTP_PASSWORD=your-ftp-password


### Docker Compose Configuration
The `docker-compose.yml` file orchestrates the services, defining how each container interacts with others and specifying the build context for each service.
It includes configurations for:
- NGINX with SSL/TLS support
- WordPress with PHP-FPM
- MariaDB for database management
- Redis for caching
- Adminer for database management UI
- FTP Server for file uploads
- Static Website for showcasing projects or personal information
- Volume mounts for persistent data storage
- Network configuration to allow communication between containers


### Makefile
The `Makefile` provides commands to build and run the Docker containers easily. It includes targets for building images, starting services, and cleaning up resources.


### How To Run 

Ensure Docker and Docker Compose are installed on your machine.

Set up your domain name to point to your local machine's IP address (e.g., your-login.42.fr).

Make sure that the volumes in the `docker-compose.yml` file are correctly set up to persist data across container restarts.

Make sure to set the environment variables in the `.env` file according to your setup.

Run the project using the commands:

make build

make up

*** This will build the required images and bring up the services as containers. ***



