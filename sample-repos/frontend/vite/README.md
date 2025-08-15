# React + Vite Frontend App

A modern React application built with Vite and Docker support, built for the **Promact Reusability Initiative**.

## Features

- ⚡️ **Vite** - Fast build tool and dev server
- ⚛️ **React 18** - Latest React with hooks and concurrent features
- 🔧 **TypeScript** - Type-safe development
- 🎨 **Modern CSS** - Beautiful UI with glassmorphism effects
- 🐳 **Docker** - Containerized development and production
- 📱 **Responsive** - Mobile-first design
- 🚀 **Hot Reload** - Instant feedback during development

## Quick Start

### Prerequisites

- Node.js 18+ 
- npm or yarn
- Docker (optional)

### Local Development

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start development server:**
   ```bash
   npm run dev
   ```

3. **Open your browser:**
   Navigate to [http://localhost:3000](http://localhost:3000)

### Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint

## Docker Development

### Development Mode (with hot reload)

```bash
# Build and run development container
docker-compose --profile dev up --build

# Or use the dev Dockerfile directly
docker build -f Dockerfile.dev -t react-vite-dev .
docker run -p 3000:3000 -v $(pwd)/src:/app/src react-vite-dev
```

### Production Mode

```bash
# Build and run production container
docker-compose --profile prod up --build

# Or use the production Dockerfile directly
docker build -t react-vite-prod .
docker run -p 80:80 react-vite-prod
```

### Custom Port

```bash
# Run on port 8080
docker-compose --profile prod-custom up --build
```

## Project Structure

```
├── src/
│   ├── App.tsx          # Main application component
│   ├── App.css          # Application styles
│   ├── main.tsx         # Application entry point
│   └── index.css        # Global styles
├── public/              # Static assets
├── Dockerfile           # Production Docker image
├── Dockerfile.dev       # Development Docker image
├── docker-compose.yml   # Docker Compose configuration
├── nginx.conf          # Nginx configuration
├── vite.config.ts      # Vite configuration
├── tsconfig.json       # TypeScript configuration
└── package.json        # Dependencies and scripts
```

## Docker Architecture

### Multi-stage Production Build

The production `Dockerfile` uses a multi-stage approach:

1. **Build Stage**: Node.js environment to build the React app
2. **Production Stage**: Nginx to serve the built static files

### Development Container

The `Dockerfile.dev` provides:
- Hot module replacement (HMR)
- Source code mounting for live editing
- Development dependencies included

### Nginx Configuration

The `nginx.conf` includes:
- Gzip compression
- Security headers
- SPA routing support
- Static asset caching
- Health check endpoint

## Environment Variables

Create a `.env` file in the root directory:

```env
VITE_API_URL=http://localhost:8000
VITE_APP_TITLE=React Vite App
```

## Building for Production

```bash
# Build the application
npm run build

# Preview the production build
npm run preview

# Build Docker image
docker build -t react-vite-app .
```

## Deployment

### Docker Deployment

```bash
# Build and run
docker build -t react-vite-app .
docker run -d -p 80:80 --name react-app react-vite-app

# Using Docker Compose
docker-compose --profile prod up -d
```

### Traditional Deployment

1. Build the application: `npm run build`
2. Deploy the `dist/` folder to your web server
3. Configure your server to handle SPA routing

## Performance Features

- **Code Splitting**: Automatic code splitting with Vite
- **Tree Shaking**: Unused code elimination
- **Gzip Compression**: Enabled in nginx
- **Asset Caching**: Long-term caching for static assets
- **Source Maps**: Available in development

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `npm run lint`
5. Submit a pull request

## License

MIT License - see LICENSE file for details
