#!/bin/sh

set -e

# Function to check if a service is up
wait_for_service() {
  host="$1"
  port="$2"
  shift 2

  until nc -z "$host" "$port"; do
    >&2 echo "Waiting for $host:$port to be available..."
    sleep 1
  done

  >&2 echo "$host:$port is available!"
}

# Wait for the database service to be available
if [ -n "$DB_SERVICE_HOST" ] && [ -n "$DB_SERVICE_PORT" ]; then
  wait_for_service "$DB_SERVICE_HOST" "$DB_SERVICE_PORT"
fi

# Execute the CMD from the Dockerfile
exec "$@"
