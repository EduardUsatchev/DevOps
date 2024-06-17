# Use a smaller base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install dependencies and clean up in one layer
RUN apt-get update && apt-get install -y --no-install-recommends gcc && \
    apt-get install -y --no-install-recommends libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy application dependencies first to utilize Docker cache
COPY requirements.txt .

# Install application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose the application port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Run the application
CMD ["flask", "run"]
