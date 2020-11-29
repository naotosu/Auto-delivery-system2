aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin パスワード　アドレス
docker tag nginx:1.18-alpine パスワード　アドレス
docker push パスワード　アドレス