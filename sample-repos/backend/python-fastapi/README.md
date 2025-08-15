# Python FastAPI Backend App

A sample FastAPI application with Python backend and Docker support, built for the **Promact Reusability Initiative**.

## Features

- **FastAPI** - Modern, fast web framework for building APIs with Python
- **Python 3.11** - Latest stable Python version
- **Docker Support** - Full containerization with health checks
- **CORS Enabled** - Cross-origin resource sharing support
- **Health Check** - Built-in health monitoring endpoint
- **Auto Documentation** - Swagger UI at `/docs` endpoint

## API Endpoints

- `GET /` - Welcome message and available endpoints
- `GET /test` - Returns the Promact Reusability Initiative message
- `GET /health` - Health check endpoint for monitoring

## Prerequisites

- Python 3.11+ (for local development)
- Docker and Docker Compose
- pip (Python package manager)

## Quick Start

### Option 1: Using Docker Compose (Recommended)

```bash
# Build and run the application
docker-compose up --build

# Run in background
docker-compose up -d --build

# Stop the application
docker-compose down
```

### Option 2: Using Docker directly

```bash
# Build the Docker image
docker build -t fastapi-sample-app .

# Run the container
docker run -p 8000:8000 fastapi-sample-app

# Run in background
docker run -d -p 8000:8000 --name fastapi-app fastapi-sample-app
```

### Option 3: Local Development

```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python main.py
# or
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

## Testing the API

Once the application is running, you can test the endpoints:

```bash
# Test the main endpoint
curl http://localhost:8000/

# Test the /test endpoint
curl http://localhost:8000/test

# Health check
curl http://localhost:8000/health
```

## API Documentation

FastAPI automatically generates interactive API documentation:

- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

## Docker Commands

```bash
# View running containers
docker ps

# View logs
docker logs <container_id>

# Stop container
docker stop <container_id>

# Remove container
docker rm <container_id>

# Remove image
docker rmi fastapi-sample-app

# View container health status
docker inspect --format='{{.State.Health.Status}}' <container_id>
```

## Environment Variables

- `PORT` - Server port (default: 8000)
- `PYTHONUNBUFFERED` - Python output buffering (default: 1)
- `PYTHONDONTWRITEBYTECODE` - Python bytecode generation (default: 1)

## Project Structure

```
.
├── main.py              # Main FastAPI application
├── requirements.txt     # Python dependencies
├── Dockerfile          # Docker configuration
├── docker-compose.yml  # Docker Compose configuration
└── README.md          # This file
```

## Health Check

The application includes a health check endpoint at `/health` that returns the application status and timestamp. Docker will use this for container health monitoring.

## Performance Features

- **Async Support** - Built-in async/await support for high performance
- **Type Hints** - Full Python type hinting for better code quality
- **Auto Validation** - Automatic request/response validation
- **OpenAPI** - Standards-compliant API specification

## Contributing

This is a sample application for the Promact Reusability Initiative. Feel free to use it as a starting point for your own projects.

## License

This project is part of the Promact Reusability Initiative.
