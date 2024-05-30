FROM python:3-alpine
COPY docker/dockerBuild-01/app.py /app
WORKDIR /app
RUN apt install ping net-tools

CMD ["python","docker/dockerBuild-01/app.py"]