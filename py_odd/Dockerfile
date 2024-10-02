# Use an official lightweight web server image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application script into the container
COPY app.py .

# Install Flask to handle requests

RUN apt-get update && apt-get install -y \
    curl \
    iproute2 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN pip install Flask ; pip install --upgrade pip;

# Expose port 5000
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]
