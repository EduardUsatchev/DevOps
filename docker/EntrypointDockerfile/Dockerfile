# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install netcat-openbsd (or netcat-traditional) for entrypoint.sh
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Install Flask
RUN pip install --no-cache-dir Flask

# Create a directory for the app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the Flask port
EXPOSE 5000

# Run the entrypoint.sh script when the container starts
ENTRYPOINT ["/entrypoint.sh"]

# Command to run the Flask application
CMD ["flask", "run"]
