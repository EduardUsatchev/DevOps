# Use an official Python runtime as a parent image
ARG pythonVersion=3.11
FROM --platform=linux/amd64 python:${pythonVersion}-slim

# Modify APT sources to use HTTPS instead of HTTP
RUN sed -i 's/http:/https:/g' /etc/apt/sources.list.d/debian.sources

# Create a system group for the application
RUN addgroup --system --gid 10000 appgrp

# Create a system user for the application
RUN adduser \
    --home /opt/app \
    --shell /usr/sbin/nologin \
    --no-create-home \
    --disabled-login \
    --disabled-password \
    --uid 10000 \
    --gid 10000 \
    app

# Set the working directory to /opt/app
WORKDIR /opt/app

# Copy your application code into the container
COPY . .

# Run any additional commands needed to set up your application
# For example, installing dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables for Flask application
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 (default Flask port)
EXPOSE 5000

# Specify the user to run the application
USER app

# Set the default command to run your application
CMD ["flask", "run"]
