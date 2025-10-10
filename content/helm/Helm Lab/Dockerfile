# Use a lightweight Python image
FROM python:3.9-slim

WORKDIR /app
COPY app.py requirements.txt ./

RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "app.py"]
