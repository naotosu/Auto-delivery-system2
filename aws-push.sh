#!/bin/sh
aws ecr get-login-password --region ap-northeast-1 | docker login --username $AWS_USERNAME --password-stdin $ECR_ADDRESS
docker build -t laravel-app/nginx:latest -f ./infra/nginx/Dockerfile . 
docker tag laravel-app/nginx:latest $ECR_ADDRESS/laravel-app/nginx:latest
docker push $ECR_ADDRESS/laravel-app/nginx:latest
docker build -t laravel-app/php-fpm:latest -f ./infra/php2/Dockerfile .
docker tag laravel-app/php-fpm:latest $ECR_ADDRESS/laravel-app/php-fpm:latest
docker push $ECR_ADDRESS/laravel-app/php-fpm:latest