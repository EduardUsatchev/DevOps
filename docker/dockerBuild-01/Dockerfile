FROM python:3-alpine
COPY app.py /app
WORKDIR /app
RUN apt install ping net-tools

CMD ["python","app.py"]