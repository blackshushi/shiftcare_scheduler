# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* System dependencies
    - Create a file master.key file under /config directory and paste this line as the credentials
        `57bcecd899ef1d99883e75e5dc5bd738`
    - Docker (Install [Docker Compose](https://docs.docker.com/compose/install/))
    - If you are not comfortable with docker
        1. Ruby version - 3.0.3
        2. You may install mongo in your local[Install Mongodb](https://www.mongodb.com/docs/v4.2/installation/)
        3. Execute `npm install` to install node dependencies
        4. Execute `yarn` (If you didn't install yarn before, please try [Install Yarn](https://classic.yarnpkg.com/en/docs/install#windows-stable)
        5. Execute `bundle install` to install ruby dependencies

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
