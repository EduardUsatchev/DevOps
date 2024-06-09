# Dockerfile
FROM python:3.9-slim

# Install required dependencies
RUN pip install requests

# Copy application code
COPY app.py /app.py

# Entry point
CMD ["python3", "/app.py"]
