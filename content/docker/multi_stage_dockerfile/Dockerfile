# Stage 1: Build Stage
# Use a Python base image for building dependencies
ARG pythonVersion=3.9
FROM python:${pythonVersion}-slim AS build

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Create and set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Production Stage
# Use a lightweight Python image for production
FROM python:${pythonVersion}-slim AS production

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
mkdir
# Copy installed Python dependencies from build stage
COPY --from=build /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

# Create and set working directory
WORKDIR /app

# Copy application code
COPY . /app/

# Expose port 5000 (default Flask port)
EXPOSE 5000

# Set Flask environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Optionally: Create a non-root user
# RUN adduser --disabled-password --gecos '' appuser \
#     && chown -R appuser /app
# USER appuser

# Command to run the application
CMD ["flask", "run"]
