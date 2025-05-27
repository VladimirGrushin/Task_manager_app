## Development instructions:
Dependencies
- Ruby 3.4.4
- Postgresql
- Node.js

Create .env file and fill it:
TASK_MANAGER_DEV_DATABASE_USERNAME=your_postgres_username    !!!
TASK_MANAGER_DEV_DATABASE_PASSWORD=your_postgres_password    !!!


Install dependencies:

'''bash
bundle install
npm install
'''

Run the server and client part:

'''bash
gem install foreman
bundle exec rake db:create
foreman start -f Procfile.dev
'''