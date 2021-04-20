# RAD2021_s3717497_s3707189

## Commands to run
```
ruby -v
rails -v

rvm list
rvm remove ruby-2.6.3
rvm use --default --install 2.7.2

gem install railties -v '5.2.5'
```

```
rails new RAD2021_s3717497_s3707189 --database=postgresql

# An error occurred while installing pg (1.2.3), and Bundler cannot continue.

# make sure all gems are installed, ensure by installing bundler first
gem install bundler

bundle install
# still pg gem cannot be installed, this is dependent on postgres installed on the OS
```

```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt install postgresql postgresql-contrib

sudo service postgresql start
sudo sudo -u postgres psql
CREATE USER ubuntu SUPERUSER PASSWORD 'password';
```

```
bundle install

# if it fails try 
gem install pg -v '1.2.3' --source 'https://rubygems.org/'

# if it still fails install libpq-dev
sudo apt-get update
sudo apt install libpq-dev

# we only need the client side of postgres, so app can act as client to postgres db

# now this should be fine
bundle install
```

```
rails s

# app should be runnning but there is not database on postgres created yet
rails db:create
```







This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
