aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 411782827307.dkr.ecr.ap-northeast-1.amazonaws.com
docker tag nginx:1.18-alpine 411782827307.dkr.ecr.ap-northeast-1.amazonaws.com/laravel-app/nginx:latest
docker push 411782827307.dkr.ecr.ap-northeast-1.amazonaws.com/laravel-app/nginx:latest