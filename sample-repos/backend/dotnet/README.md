# .NET Backend API

A simple .NET Web API that returns a message when accessing the `/test` endpoint.

## Features

- GET `/test` - Returns "Promact Reusability Initiative - dotnet build using docker"
- Swagger UI for API documentation
- Docker support

## Prerequisites

- .NET 8.0 SDK
- Docker (optional)

## Running Locally

1. Restore dependencies:
   ```bash
   dotnet restore
   ```

2. Build the application:
   ```bash
   dotnet build
   ```

3. Run the application:
   ```bash
   dotnet run
   ```

4. Access the API:
   - API endpoint: `http://localhost:5000/test`
   - Swagger UI: `http://localhost:5000/swagger`

## Running with Docker

1. Build the Docker image:
   ```bash
   docker build -t test-api .
   ```

2. Run the container:
   ```bash
   docker run -p 8080:80 test-api
   ```

3. Access the API:
   - API endpoint: `http://localhost:8081/test`
   - Swagger UI: `http://localhost:8081/swagger`

## API Endpoints

- `GET /test` - Returns the message "Promact Reusability Initiative - dotnet build using docker"
