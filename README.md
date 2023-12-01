# Bankwiz Tools
## Description
Bankwiz Tools is a suite of Docker configurations and Makefile scripts designed to facilitate the deployment and management of a server application, a MySQL database, and additional utilities like phpMyAdmin and Swagger Editor. This project is intended to be used with the jbwittner/bankwiz_openapi repository.

## Requirements

Before starting with Bankwiz Tools, ensure you have the following prerequisites installed and set up on your system:

- **Docker**: Bankwiz Tools uses Docker to run MySQL, phpMyAdmin, Swagger Editor, and the server application. Ensure you have Docker installed and running. [Download Docker](https://www.docker.com/products/docker-desktop)

- **Docker Compose**: This project uses Docker Compose for defining and running multi-container Docker applications. Docker Compose should be included in your Docker Desktop installation. [Docker Compose Documentation](https://docs.docker.com/compose/)

- **Make**: The project uses a Makefile to simplify command execution. Make sure you have a GNU make tool installed. [GNU Make](https://www.gnu.org/software/make/)

### Verifying Installation

To verify if you have Docker and Docker Compose installed, run the following commands:

```bash
docker --version
docker-compose --version
```

## Configuration
The project includes the following files:

- **compose.yaml**: Docker configuration for MySQL, phpMyAdmin, and Swagger Editor.
- **compose.app.yaml**: Docker configuration for the server application.
Makefile: Scripts to aid in project management.

## Quick Start
To get the project up and running, follow these steps:

Start Base Services:

```bash
make start
```
This will launch MySQL, phpMyAdmin, and Swagger Editor.

Start the Server Application:

```bash
make start-app
```
This will launch the server application, depending on the base services.

## Database Restoration
To restore the database, use the following commands:

Restore the database system:
```bash
make restore-system
```

Restore the database tables:
```bash
make restore-table
```

Insert test data:
```bash
make restore-data
```

## Application Update
To update the server application:

```bash
make update-app
```
Viewing Logs
To follow the logs of the server application:

```bash
make logs-app
```

## Stopping the Project
To stop all services:

```bash
make down
```