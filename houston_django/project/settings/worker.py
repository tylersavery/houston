from project.settings.environment import ENV

CELERY_BROKER_URL = ENV.str("BROKER_URL")
CELERY_ACCEPT_CONTENT = ["application/json"]
CELERY_RESULT_BACKEND = None
CELERY_RESULT_SERIALIZER = "json"
CELERY_TASK_ANNOTATIONS = {
    "*": {
        "max_retries": ENV.int("CELERY_MAX_RETRIES", default=5),
        "retry_backoff": ENV.bool("CELERY_RETRY_BACKOFF", default=True),
    }
}
CELERY_TASK_SERIALIZER = "json"

PROCESS_TASKS_ASYNC = ENV.bool("PROCESS_TASKS_ASYNC", True)
