from project.celery import app


def revoke_task(task_id, *, terminate=True):
    app.control.revoke(task_id, terminate=terminate)
