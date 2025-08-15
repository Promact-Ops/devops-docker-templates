# Next.js Backend App

A sample Next.js application with Node.js backend and Docker support, built for the **Promact Reusability Initiative**.

## Prerequisites

- Node.js 18+ 
- Docker and Docker Compose
- npm or yarn

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Development Mode

```bash
npm run dev
```

The app will be available at `http://localhost:3000`

### 3. Build for Production

```bash
npm run build
npm start
```

## Docker Usage

### Build Docker Image

```bash
docker build -t nextjs-app .
```

### Run with Docker

```bash
docker run -p 3000:3000 nextjs-app
```

### Using Docker Compose

```bash
docker-compose up --build
```

## API Endpoints

### GET /api/test

Returns the Promact Reusability Initiative message:

```json
{
  "message": "Promact Reusability Initiative - next.js build using docker",
  "timestamp": "2024-01-01T00:00:00.000Z",
  "status": "success"
}
```

### POST /api/test

Same response as GET with additional method information.

## Project Structure

```
├── app/
│   ├── api/
│   │   └── test/
│   │       └── route.ts          # API endpoint
│   ├── globals.css               # Global styles
│   ├── layout.tsx                # Root layout
│   └── page.tsx                  # Home page
├── Dockerfile                    # Docker configuration
├── docker-compose.yml            # Docker Compose config
├── next.config.js                # Next.js configuration
├── package.json                  # Dependencies
├── tsconfig.json                 # TypeScript config
└── README.md                     # This file
```

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `npm run lint` - Run ESLint

## Docker Commands

- `docker build -t nextjs-app .` - Build image
- `docker run -p 3000:3000 nextjs-app` - Run container
- `docker-compose up --build` - Start with Docker Compose
- `docker-compose down` - Stop containers

## Environment Variables

- `NODE_ENV` - Environment (development/production)
- `PORT` - Port number (default: 3000)
- `HOSTNAME` - Host binding (default: 0.0.0.0)

## Contributing

This is a sample application for the Promact Reusability Initiative. Feel free to use it as a starting point for your own projects.

## License

This project is part of the Promact Reusability Initiative.
