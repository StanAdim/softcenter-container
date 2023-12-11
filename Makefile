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
	docker exec softcenter bash -c "composer update"
	docker exec softcenter bash -c "php artisan key:generate"
node:
	docker exec softcenter bash -c "nvm install v18.17.1"
	
optimize:
	docker exec softcenter bash -c "php artisan optimize:fresh"
data:
	docker exec softcenter bash -c "php artisan migrate:fresh --seed"

bash:
	docker exec -it softcenter bash

fresh:
	docker compose restart
rmi:
	docker image rm -f softcenter-softcenter
