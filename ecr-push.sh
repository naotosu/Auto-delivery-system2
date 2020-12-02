#!/bin/sh
aws ecr get-login-password --region ap-northeast-1 | docker login --username $AWS_USERNAME --password-stdin $ECR_ADDRESS
docker tag nginx:1.18-alpine $ECR_ADDRESS/laravel-app/nginx:latest
docker push $ECR_ADDRESS/laravel-app/nginx:latest
docker build -t auto-delivery-system2_app ./infra/php/
docker tag auto-delivery-system2_app:latest $ECR_ADDRESS/laravel-app/php-fpm:latest
docker push $ECR_ADDRESS/laravel-app/php-fpm:latest