#!/bin/bash
set -e

# Apply database migrations
python manage.py migrate


# Start the appropriate server
if [ "$DJANGO_ENV" != "production" ]; then
  python manage.py runserver 0.0.0.0:8000
fi