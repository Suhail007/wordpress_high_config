# Custom WordPress Docker Setup

This repository contains a customized WordPress setup using Docker, with enhanced security and performance configurations.

## Features

- WordPress latest version
- MySQL 5.7 database
- Custom PHP configurations
- Enhanced security settings
- Increased upload limits
- Debug mode enabled for development

## Prerequisites

- Docker
- Docker Compose

## Setup Instructions

1. Clone this repository:
   ```bash
   git clone <your-repository-url>
   cd <repository-name>
   ```

2. Start the containers:
   ```bash
   docker-compose up -d
   ```

3. Access WordPress:
   - Open your browser and navigate to `http://localhost:8000`
   - Follow the WordPress installation wizard

## Default Credentials

- Database Name: wordpress
- Database User: wordpress
- Database Password: wordpress
- Database Host: db

## Customization

- WordPress content is stored in the `wp-content` directory
- Custom configurations can be modified in `wp-config-custom.php`
- Docker configurations can be adjusted in `docker-compose.yml`

## Security Notes

- Change the default database credentials in production
- Update the WordPress admin password after installation
- Consider using environment variables for sensitive data

## Development

- Debug mode is enabled by default
- Logs are stored in `wp-content/debug.log`
- File editing in admin is disabled for security

## License

This project is licensed under the MIT License - see the LICENSE file for details. 