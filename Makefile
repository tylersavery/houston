
server_run:
	cd spriver_server && dart bin/main.dart

server_gen:
	cd spriver_server && serverpod generate

migrate:
	cd spriver_server && dart bin/main.dart --apply-migrations