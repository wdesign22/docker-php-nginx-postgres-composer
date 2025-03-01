docker-up: memory
	docker-compose up -d

docker-down:
	 docker-compose down --remove-orphans

docker-build: memory
	 docker-compose up --build -d

test:
	 docker-compose exec php-cli vendor/bin/phpunit

assets-install:
	  docker-compose exec node yarn install

assets-rebuild:
	 docker-compose exec node npm rebuild node-sass --force

assets-dev:
	 docker-compose exec node yarn run dev

assets-prod:
	 docker-compose exec node yarn run prod

assets-watch:
	 docker-compose exec node yarn run watch

queue:
	 docker-compose exec php-cli php artisan queue:work

horizon:
	 docker-compose exec php-cli php artisan horizon

horizon-pause:
	 docker-compose exec php-cli php artisan horizon:pause

horizon-continue:
	 docker-compose exec php-cli php artisan horizon:continue

horizon-terminate:
	 docker-compose exec php-cli php artisan horizon:terminate

memory:
	 sysctl -w vm.max_map_count=262144

perm:
	 sudo chgrp -R www-data storage bootstrap/cache
	 sudo chmod -R ug+rwx storage bootstrap/cache

artisan-migrate:
	 docker-compose exec php-cli php artisan migrate

artisan-clear:
	 docker-compose exec php-cli php artisan cache:clear
	 docker-compose exec php-cli php artisan route:cache
	 docker-compose exec php-cli php artisan view:clear
	 docker-compose exec php-cli php artisan config:cache

