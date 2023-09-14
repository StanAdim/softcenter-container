setup:
	@make build
	@make up 
	@make composer-update
build:
	docker compose build 
stop:
	docker compose stop
up:
	docker compose up -d
composer-update:
	docker exec softcenter-app bash -c "composer update"
data:
	docker exec softcenter-app bash -c "php artisan migrate:fresh --seed"
bash:
	docker exec -it softcenter-app bash
fresh:
	docker compose restart
