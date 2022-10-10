#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

RAILS_ENV=production bundle exec rake install_seed_data

# Then exec the container's main process (what's set as CMD in the Dockerfile).
RAILS_ENV=production bundle exec puma -C config/puma.rb