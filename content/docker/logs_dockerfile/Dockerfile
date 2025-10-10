# Use a specific version of Python
ARG pythonVersion=3.9
FROM --platform=linux/amd64 python:${pythonVersion}-slim

# Update sources list to use HTTPS instead of HTTP
RUN sed -i 's/http:/https:/g' /etc/apt/sources.list.d/debian.sources

# Add a non-root user with a static UID and GID
RUN addgroup --system --gid 10000 appgrp \
    && adduser --home /opt/app --shell /usr/sbin/nologin --no-create-home --disabled-login --disabled-password --uid 10000 --gid 10000 app

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the application code
COPY . /app

# Expose ports
EXPOSE 5000
EXPOSE 8000
EXPOSE 8080

# Environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Create a directory for logs and set permissions
RUN mkdir -p /var/log/my-flask-app \
    && chown -R 10000:10000 /var/log/my-flask-app

# Run the application as the non-root user
USER app

# Command to run the Flask application
CMD ["python", "app.py"]
