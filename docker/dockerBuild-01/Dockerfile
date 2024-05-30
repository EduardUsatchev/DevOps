FROM python:3-alpine
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN apt install ping net-tools

CMD ["python","app.py"]