# Use a specific Python version
FROM python:3.11-slim

# Set working directory
WORKDIR /data

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3-setuptools && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Run Django migrations
RUN python manage.py migrate

# Expose the default Django port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
