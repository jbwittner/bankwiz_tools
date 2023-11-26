MYSQL_ROOT_PASSWORD := BankwizRootPass2023

.PHONY: restore-system
restore-system:
	@docker exec -i bankwiz_mysql sh -c 'exec mysql -uroot -p"$(MYSQL_ROOT_PASSWORD)"' < sql/prepare.sql

.PHONY: restore-table
restore-table: restore-system
	@docker exec -i bankwiz_mysql sh -c 'exec mysql -uroot -p"$(MYSQL_ROOT_PASSWORD)" bankwiz_db' < sql/database.sql

.PHONY: restore-data
restore-data:
	@docker exec -i bankwiz_mysql sh -c 'exec mysql -uroot -p"$(MYSQL_ROOT_PASSWORD)" bankwiz_db' < sql/data.sql

.PHONY: restore
restore: restore-system restore-table restore-data

.PHONY: dump-table
dump-table:
	@docker exec bankwiz_mysql sh -c 'exec mysqldump --no-data -uroot -p"$(MYSQL_ROOT_PASSWORD)" --single-transaction bankwiz_db' > sql/database.sql

.PHONY: dump-data
dump-data:
	@docker exec bankwiz_mysql sh -c 'exec mysqldump --no-create-info -uroot -p"$(MYSQL_ROOT_PASSWORD)" bankwiz_db' > sql/data.sql

.PHONY: dump
dump: dump-table dump-data

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


