MYSQL_ROOT_PASSWORD := BankwizRootPass2023
PG_PASSWORD := BankwizPass2023
PG_USER := bankwiz_user
PG_DATABASE := bankwiz_db


.PHONY: restore-table
restore-table:
	@docker exec -i bankwiz_database /bin/bash -c "PGPASSWORD=$(PG_PASSWORD) psql --username $(PG_USER) $(PG_DATABASE)" < sql/database.sql

.PHONY: restore-data
restore-data:
	@docker exec -i bankwiz_database /bin/bash -c "PGPASSWORD=$(PG_PASSWORD) psql --username $(PG_USER) $(PG_DATABASE)" < sql/data.sql

.PHONY: backup-table
backup-table:
	@docker exec -i bankwiz_database /bin/bash -c "PGPASSWORD=$(PG_PASSWORD) pg_dump --schema-only --clean --username $(PG_USER) $(PG_DATABASE)" > sql/database.sql

.PHONY: backup-data
backup-data:
	@docker exec -i bankwiz_database /bin/bash -c "PGPASSWORD=$(PG_PASSWORD) pg_dump --data-only --username $(PG_USER) $(PG_DATABASE)" > sql/data.sql

.PHONY: restore
restore: restore-table restore-data

.PHONY: backup
backup: backup-table backup-data

.PHONY: start
start:
	@docker compose -f compose.yaml up -d

.PHONY: start-app
start-app:
	@docker compose -f compose.yaml -f compose.app.yaml up -d

.PHONY: remove-app
remove-app:
	@docker image rm ghcr.io/jbwittner/bankwiz_server:develop-latest

.PHONY: update-app
update-app: down-app remove-app start-app

.PHONY: down
down:
	@docker compose -f compose.yaml -f compose.app.yaml down -v

.PHONY: down-app
down-app:
	@docker compose -f compose.yaml -f compose.app.yaml down serverapp

.PHONY: logs-app
logs-app:
	@docker logs bankwiz_server --follow