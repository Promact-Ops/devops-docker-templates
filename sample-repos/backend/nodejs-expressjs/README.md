# Express.js Backend App

A simple Express.js application with Docker support that demonstrates the Promact Reusability Initiative.

## Features

- Express.js REST API
- `/test` endpoint returning "Promact Reusability Initiative - express.js build using docker"
- Docker containerization
- Health check endpoint
- CORS support

## API Endpoints

- `GET /` - Welcome message and available endpoints
- `GET /test` - Returns the Promact Reusability Initiative message
- `GET /health` - Health check endpoint

## Prerequisites

- Node.js 18+ (for local development)
- Docker and Docker Compose

## Quick Start with Docker

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
docker build -t expressjs-sample-app .

# Run the container
docker run -p 3000:3000 expressjs-sample-app

# Run in background
docker run -d -p 3000:3000 --name expressjs-app expressjs-sample-app
```

## Local Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Start production server
npm start
```

## Testing the API

Once the application is running, you can test the endpoints:

```bash
# Test the main endpoint
curl http://localhost:3000/

# Test the /test endpoint
curl http://localhost:3000/test

# Health check
curl http://localhost:3000/health
```

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
docker rmi expressjs-sample-app
```

## Environment Variables

- `PORT` - Server port (default: 3000)
- `NODE_ENV` - Environment mode (default: production in Docker)

## Project Structure

```
.
├── app.js              # Main application file
├── package.json        # Dependencies and scripts
├── Dockerfile          # Docker configuration
├── docker-compose.yml  # Docker Compose configuration
├── .dockerignore       # Docker ignore file
└── README.md          # This file
```

## Health Check

The application includes a health check endpoint at `/health` that returns the application status and timestamp. Docker will use this for container health monitoring.
