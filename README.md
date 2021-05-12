# RAD2021_s3707189_s3717497

## Assignment commands
```
rails g scaffold Item name:string description:text image_link:text price:float arrival_date:date
rails g controller collections index men women kids new_ins
rails g model visitor email:string
rails g model collection_item category:integer item:references
rails g controller saved index
rails g model user name:string email:string password_digest:string // needs bcrypt and put has_secure_password in user class
rails g model bag_items colour:integer size:integer quantity:integer item:references user:references
rails g model bag_items colour:integer size:integer quantity:integer item:references user:references
rails g model item_image item:references image_link
```

Can drop tables now, with `rails db:reset`. It also does the job of seeding data, and means migration files can be edited directly

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
rails new RAD2021_s3707189_s3717497 --database=postgresql

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

```
npm uninstall -g heroku-cli
sudo snap install heroku --classic
npm install -g heroku

heroku login -i
# login using your own heroku credentials
heroku create

git remote -v

# deploy git:master to heroku:master
git push heroku master

# deploy git:HEAD (curent branch checked out) to heroku:master
git push heroku +HEAD:master

# now app should be on the the heroku endpoint

```

```
# don't try below... just use for reference
heroku create
heroku buildpacks:add heroku/ruby
git remote -v
git push heroku master
heroku run rake db:migrate

# if you want to connect to an existing heroku app
heroku git:remote -a yourappnamegoeshere

# see logs
heroku logs --tail
# to run console activerecord commands
heroku run rails c
# restart
heroku restart

# log into heroku from console
heroku login -i
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
