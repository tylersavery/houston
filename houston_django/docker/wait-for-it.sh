#!/usr/bin/env bash
# wait-for-it.sh from https://github.com/vishnubob/wait-for-it
set -e

host="$1"
shift
cmd="$@"

until nc -z "$host" 5432; do
  echo "Waiting for Postgres at $host:5432..."
  sleep 1
done

exec $cmd