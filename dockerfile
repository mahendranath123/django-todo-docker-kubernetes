FROM python:3.13-slim

WORKDIR /data

# Install dependencies, including setuptools for distutils
RUN apt-get update && apt-get install -y python3-setuptools

# Copy project files and install requirements
COPY . .
RUN pip install -r requirements.txt

# Run Django migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
