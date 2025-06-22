# ---- Docker Helpers ----
build:
	docker compose build

up:
	docker compose up --detach

down:
	docker compose down

restart:
	docker compose down && docker compose up --detach

bash:
	docker compose exec web bash

wipe:l
	@read -p "⚠️  This will stop and remove all containers and volumes. Continue? (y/N) " CONFIRM; \
	if [ "$$CONFIRM" = "y" ] || [ "$$CONFIRM" = "Y" ]; then \
		docker compose down -v; \
	else \
		echo "❌ Cancelled."; \
	fi
	

# ---- Django Management ----

manage:
	docker compose exec web python manage.py $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

migrate:
	docker compose exec web python manage.py migrate

makemigrations:
	docker compose exec web python manage.py makemigrations

shell:
	docker compose exec web python manage.py shell

createsuperuser:
	docker compose exec web python manage.py createsuperuser

collectstatic:
	docker compose exec web python manage.py collectstatic --noinput

# ---- Dev Server (inside container) ----
dev:
	docker compose exec web python manage.py runserver 0.0.0.0:8000


# ---- Celery ----
celery:
	docker compose exec web celery -A config worker --loglevel=info

# ---- Logs ----
logs:
	docker compose logs -f web

logs-celery:
	docker compose logs -f web | grep celery

# ---- Testing ----
test:
	docker compose exec web python manage.py test


# ---- Admin ----
admin_theme_dump:
	docker compose exec web python manage.py dumpdata admin_interface.Theme --indent 4 -o admin/fixtures/admin_interface_theme.json 

admin_theme_load:
	docker compose exec web python manage.py loaddata ./admin/fixtures/admin_interface_theme.json


	
