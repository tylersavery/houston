server_run:
	cd houston_server && dart bin/main.dart

server_gen:
	cd houston_server && serverpod generate

cli_run:
	cd houston_cli && dart bin/cli.dart

create_migration:
	cd houston_server && serverpod create-migration

migrate:
	cd houston_server && dart run bin/main.dart --role maintenance --apply-migrations

init:
	cd houston_server && docker-compose up -d

destroy:
	cd houston_server && docker compose down -v