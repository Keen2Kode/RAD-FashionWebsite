#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# don't need persistent data, so just create and load the database on each startup
bundle exec rails db:setup

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
