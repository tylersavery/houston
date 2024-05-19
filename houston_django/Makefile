.PHONY:  install run release web worker

install:
	pip install -r requirements.txt

run:
	python manage.py runserver 0.0.0.0:8000

release:
	python manage.py migrate

web:
	gunicorn project.wsgi --log-file -

worker:
	celery --app=project worker --without-heartbeat --without-gossip --without-mingle --loglevel=INFO
