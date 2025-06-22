# Houston Service

Here's how to get up and running!


#### Create `.env`

Copy the example and tweak values if needed:

```bash
cp .env.example .env
```


#### Setup local venv (optional)

You can either use the `Dev Containers` vs code extension to work directly in docker OR just mirror docker's pythong environment with your local virtual environment. For the former, simply run:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```


#### Build & Run Services

```bash
make build
make up
```


#### Run initial setup

```bash
make migrate
make createsuperuser
```

#### Load the admin theme data
```bash
make admin_theme_load
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
