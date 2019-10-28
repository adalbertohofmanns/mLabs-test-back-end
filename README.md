### LINUX:
    apt install docker
    apt install docker-compose

### TO RUN WITH DOCKER:
    docker-compose build (this will build the application)
    docker-compose up -d (this will execute application, -d run in background)

### TO CREATE AND MIGRATE DATABASE:
    rails run:setup

### TO DROP DATABASE:
    __ first, stop the server (docker-compose down) __
    then RUN
    docker-compose run web bundle exec rake db:drop RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1

### TO STOP SERVER:
    docker-compose down