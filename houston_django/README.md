# Houston Service

### Setup

- [ ] [Create environment](#create-environment)
- [ ] [Docker Services (Optional)](#docker-services-optional)
- [ ] [Configure environment](#configure-environment)
- [ ] [Update database](#update-database)
- [ ] [Run application](#run-application)

#### Create Environment

Create Python virtual environment and install dependencies

```
python3 -m venv venv
source venv/bin/activate
make install
```

#### Docker Services

You can run necessary services with Docker; db (postgres), cache (redis), and broker (rabbitmq).

```
docker compose -p houston_django up -d
```

#### Configure Environment

Create `.env` file in the project root and configure required variables. See [configuration](#configuration).

```
cp .env.example .env
```

*WARNING*: The provided configuration is intended for local development only.

```
DATABASE_URL=postgres://postgres:postgres@localhost:5432/postgres
REDIS_URL=redis://localhost:6379
AMQP_URL=amqp://rabbitmq:rabbitmq@localhost:5672
```

These are the other required .env variables:
```
AUTH_JWT_SIGNING_KEY=
AUTH_TOKEN_SECRET=
AWS_ACCESS_KEY_ID=
AWS_DEFAULT_REGION=
AWS_SECRET_ACCESS_KEY=
AWS_STORAGE_BUCKET_NAME=
SECRET_KEY=
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_FROM_NUMBER=
```
For your local environment, you will probably want these set as so:
```
SECURE_SSL_REDIRECT=False
DEBUG=True
```


With the services running you can view the RabbitMQ dashboard @ [http://localhost:15672](http://localhost:15672).


#### Update Database

Sync database with project.

```
python manage.py migrate
```

#### Configure Database

Import fixtures.

```
python manage.py loaddata admin/fixtures/theme.json
```

Create superuser.
```
python manage.py createsuperuser
```


#### Run Application

Run Django development server

```
source venv/bin/activate
make run
```

Run Celery worker queue

```
source venv/bin/activate
make worker
```

## Configuration

| Module                | Variable                                     | Type          | Default                               |
| --------------------- | -------------------------------------------- | ------------- | ------------------------------------- |
| Access                | ALLOWED_HOSTS                                | list(str)     | ["*"]                                 |
| Access                | MAINTENANCE_MODE                             | bool          | False                                 |
| Admin                 | ADMIN_ENABLED                                | bool          | True                                  |
| Admin                 | ADMIN_URL_PATH                               | str           | "manage/"                             |
| Admin                 | ADMIN_ACE_THEME                              | str           | chrome                                |
| Admin                 | ADMIN_THEME_EDITABLE                         | bool          | False                                 |
| API                   | API_ENABLED                                  | bool          | True                                  |
| API                   | API_THROTTLE_ENABLED                         | bool          | True                                  |
| API                   | API_DEFAULT_PAGE_SIZE                        | int           | 10                                    |
| API                   | API_MAX_PAGE_SIZE                            | int           | 100                                   |
| API                   | API_THROTTLE_RATE_ANON                       | str           | "60/min"                              |
| API                   | API_THROTTLE_RATE_USER                       | str           | "60/min"                              |
| API                   | API_THROTTLE_RATE_OTP                        | str           | "1/min"                               |
| Auth                  | AUTH_PASSWORD_MIN_LENGTH                     | int           | 8                                     |
| Auth                  | AUTH_JWT_ACCESS_TOKEN_TIMEOUT                | int           | 86400 (1 day)                         |
| Auth                  | AUTH_JWT_REFRESH_TOKEN_TIMEOUT               | int           | 604800 (1 week)                       |
| Auth                  | AUTH_JWT_SIGNING_KEY                         | str           |                                       |
| Auth                  | AUTH_TOKEN_SECRET                            | str           |                                       |
| Auth                  | AUTH_TOKEN_TIMEOUT                           | int           | 259200 (3 days)                       |
| Auth                  | AUTH_OTP_TIMEOUT                             | int           | 60 (1 minute)                         |
| AWS                   | AWS_ACCESS_KEY_ID                            | str           |                                       |
| AWS                   | AWS_DEFAULT_REGION                           | str           |                                       |
| AWS                   | AWS_SECRET_ACCESS_KEY                        | str           |                                       |
| AWS                   | AWS_STORAGE_BUCKET_NAME                      | str           |                                       |
| Cache                 | REDIS_URL                                    | str           |                                       |
| Cache                 | CACHE_ENABLED                                | bool          | True                                  |
| Cache                 | CACHE_KEY_PREFIX                             | str           | ""                                    |
| Cache                 | CACHE_TIMEOUT_DEFAULT                        | int           | 300 (5 minutes)                       |
| Cache                 | CACHE_TIMEOUT_LONG                           | int           | 3600 (1 hour)                         |
| Cache                 | CACHE_TIMEOUT_SHORT                          | int           | 10 (10 seconds)                       |
| Cache                 | CACHE_VERSION                                | int           | 1                                     |
| CORS                  | CORS_ALLOW_ALL_ORIGINS                       | bool          | False                                 |
| CORS                  | CORS_ALLOW_HEADERS                           | list(str)     | corsheaders.defaults.default_headers  |
| CORS                  | CORS_ALLOW_METHODS                           | list(str)     | corsheaders.defaults.default_methods  |
| CORS                  | CORS_ALLOWED_ORIGIN_REGEXES                  | list(str)     | []                                    |
| CORS                  | CORS_ALLOWED_ORIGINS                         | list(str)     | []                                    |
| CORS                  | CORS_URLS_REGEX                              | str           | "r'^.*$'"                             |
| Database              | DATABASE_URL                                 | str           |                                       |
| Develop               | DEBUG                                        | bool          | False                                 |
| Environment           | ENVIRONMENT                                  | str           | "undefined"                            |
| i18n                  | LANGUAGE_CODE                                | str           | "en"                                  |
| i18n                  | TIME_ZONE                                    | str           | "UTC"                                 |
| Logging               | SENTRY_DNS                                   | str           | None                                  |
| Logging               | SENTRY_TRACES_SAMPLE_RATE                    | float          | 1.0                                   |
| Security              | SECRET_KEY                                   | str           |                                       |
| Security              | SECURE_SSL_REDIRECT                          | bool          | True                                  |
| Twilio                | TWILIO_ACCOUNT_SID                           | str           |                                       |
| Twilio                | TWILIO_AUTH_TOKEN                            | str           |                                       |
| Twilio                | TWILIO_FROM_NUMBER                           | str           |                                       |
| Worker                | AMQP_URL                                     | str           |                                       |
| Worker                | CELERY_MAX_RETRIES                           | int           | 3                                     |
| Worker                | CELERY_RETRY_BACKOFF                         | bool          | True                                  |
