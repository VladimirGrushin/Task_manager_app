# Task Manager App

Task Manager is a comprehensive web application for task management with advanced features for team collaboration and productivity tracking.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Project Structure](#project-structure)
- [Contact](#contact)

---

## Features

### Core Functionality
- **User Authentication**: Secure login system with Devise
- **Role Management**: Admin and Member roles with different permissions
- **Task Operations**: Full CRUD functionality for tasks
- **Category System**: Tasks organization through categories
- **Status Tracking**: Three-stage workflow (`pending`, `in_progress`, `completed`)

### Advanced Features
- Deadline reminders and notifications
- Task assignment and delegation
- Activity history and audit trail
- Data export (CSV, PDF)

### Technical Highlights
- Responsive design with Bootstrap 5
- Turbo Streams for real-time updates
- RESTful API endpoints
- Comprehensive test coverage

---

## Installation

### Prerequisites
- Ruby 3.4.4
- PostgreSQL 14+
- Node.js 18+
- Yarn 1.22+

### Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/VladimirGrushin/Task_manager_app.git
   cd Task_manager_app
2. Make sure Node.js and Yarn are installed:
    https://classic.yarnpkg.com/en/docs/install/#windows-stable
    https://nodejs.org/en
3. Install dependencies:
    ```bash
    bundle install
    yarn install
4. Create .env file in project root:
    ```bash
    touch .env
5. Add these variables to .env (replace with your actual credentials):
    ```bash
    TASK_MANAGER_DEV_DATABASE_USERNAME=your_postgres_username
    TASK_MANAGER_DEV_DATABASE_PASSWORD=your_postgres_password
6. Initialize database:
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed

### How to Find PostgreSQL Credentials

1. Check your PostgreSQL username (usually 'postgres'):
    ```bash
    psql -U postgres -c "SELECT usename FROM pg_user;"
2. If you forgot password:
    ```bash
    sudo -u postgres psql
    \password postgres


## Usage

### Start the application:
    ```bash
    foreman start -f Procfile.dev

Access at: http://localhost:5000 or http://localhost:3000
OR check the actual port in console output after startup

Default admin account:

Email: admin@example.com
Password: password

## Testing
### Run test suite:
    ```bash
    rspec

## Project Structure
### Key directories:

app/
├── controllers/
├── models/
├── views/
config/
├── database.yml
.env - environment variables

Contact
Development Team: dev@taskmanager.com
Maintainers:
Vladimir Grushin ([@VladimirGrushin](https://github.com/VladimirGrushin))
Nubaryan ALbert ([@alnubvar](https://github.com/alnubvar))
Kirkina Yulya ([@kyulyak](https://github.com/kyulyak))
