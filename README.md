# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* System dependencies
    1. docker (Install [Docker Compose](https://docs.docker.com/compose/install/))
    2. If you are not comfortable with docker
        1. Ruby version - 3.0.3
        1. You may install mongo in your local[Install Mongodb](https://www.mongodb.com/docs/v4.2/installation/)
        2. Execute `yarn` to install node dependencies
        3. Execute `bundle install` to install ruby dependencies

* Seed data
    1. Please execute `rake install_seed_data` if you wish to have the seed data in db.
        - You are not required to do this if you are running with docker.

* Explore the Website
    1. With docker
        1. Execute `docker-compose up`
        2. Browse "http://localhost:3000"
    2. Without docker
        1. Make sure installed mongodb and run the services in background with port 27017
        2. Execute `rails s` in project directory 
        3. Browse "http://localhost:3000"
