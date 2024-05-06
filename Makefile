
server_run:
	cd spriver_server && dart bin/main.dart

server_gen:
	cd spriver_server && serverpod generate

create_migration:
	cd spriver_server && serverpod create-migration

migrate:
	cd spriver_server && dart run bin/main.dart --role maintenance --apply-migrations
