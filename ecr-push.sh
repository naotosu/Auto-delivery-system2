. ./laravel/.env
aws ecr get-login-password --region ap-northeast-1 | docker login --username $ECR_USERNAME --password-stdin $ECR_PASSWORD
docker tag nginx:1.18-alpine $ECR_PASSWORD/laravel-app/nginx:latest
docker push $ECR_PASSWORD/laravel-app/nginx:latest
docker build -t auto-delivery-system2_app ./infra/php/
docker tag auto-delivery-system2_app:latest $ECR_PASSWORD/laravel-app/php-fpm:latest
docker push $ECR_PASSWORD/laravel-app/php-fpm:latest