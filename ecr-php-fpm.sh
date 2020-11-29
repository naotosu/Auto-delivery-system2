aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 411782827307.dkr.ecr.ap-northeast-1.amazonaws.com
docker build -t auto-delivery-system2_app ./infra/php/
docker tag auto-delivery-system2_app:latest 411782827307.dkr.ecr.ap-northeast-1.amazonaws.com/laravel-app/php-fpm:latest
docker push 411782827307.dkr.ecr.ap-northeast-1.amazonaws.com/laravel-app/php-fpm:latest