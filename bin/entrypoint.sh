#!/bin/bash

while ! pg_isready -q -h $DB_HOST -p $DB_PORT -U $POSTGRES_USER
do
  echo "$(date) - waiting for database to start."
  sleep 2
done

# If the database exists, migrate. Otherwise setup (create and migrate)
echo "Running database migrations..."
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate
echo "Finished running database migrations."

# Remove a potentially pre-existing server.pid for Rails.
echo "Deleting server.pid file..."

set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /current/tmp/pids/server.pid ]; then
  rm /current/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"