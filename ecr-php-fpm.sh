aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin パスワード　アドレス
docker build -t auto-delivery-system2_app ./infra/php/
docker tag auto-delivery-system2_app:latest パスワード　アドレス
docker push パスワード　アドレス