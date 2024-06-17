docker build -t flask-app -f docker/flaskDockerBuild/Dockerfile
docker build --progress=plain -t flask-app .
docker run -p 5000:5000 flask-app
docker-compose up --build
