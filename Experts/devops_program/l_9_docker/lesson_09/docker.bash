docker run -d -p 80:80 nginx:alpine
docker build -t my_image -f Dockerfile
docker run -d my_image
docker logs
docker exec -it 890 sh
docker network create wordpress
docker run --name wordpress-container --rm --network wordpress -e WORDPRESS_DB_HOST=mysql-container -e WORDPRESS_DB_PASSWORD=wordpress -p 8090:80 -d wordpress
docker run --name mysql-container --rm --network wordpress -e MYSQL_ROOT_PASSWORD=wordpress -d mariadb:latest
docker exec -it mysql-container bash / sh
  curl http://wordpress-container
  curl 172.20.0.2
docker-compose up -d
docker rm -vf $(docker ps -qa)
docker tag my_image eduardusatchev/my_image:v1302-edi
docker login
docker push a18ab77c4b90/my_image:v1302-edi
docker run -it -v /Users/e0u00jg/Desktop/DevOpsCourse/DevOps1302/lessons/lesson_09/my_docker/data:/data alpine:latest
