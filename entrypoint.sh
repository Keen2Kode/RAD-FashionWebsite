#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# don't need persistent data, so just create and load the database on each startup
# however don't forget to run bundle exec rails db:seed once
bundle exec rails db:create db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
