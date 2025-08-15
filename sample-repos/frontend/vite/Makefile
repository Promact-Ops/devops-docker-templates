.PHONY: help install dev build preview lint clean docker-build docker-run docker-dev docker-stop

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	npm install

dev: ## Start development server
	npm run dev

build: ## Build for production
	npm run build

preview: ## Preview production build
	npm run preview

lint: ## Run ESLint
	npm run lint

clean: ## Clean build artifacts
	rm -rf dist node_modules

docker-build: ## Build production Docker image
	docker build -t react-vite-app .

docker-run: ## Run production Docker container
	docker run -d -p 80:80 --name react-app react-vite-app

docker-dev: ## Run development Docker container
	docker-compose --profile dev up --build

docker-prod: ## Run production Docker container
	docker-compose --profile prod up --build

docker-stop: ## Stop all Docker containers
	docker-compose down
	docker stop react-app || true
	docker rm react-app || true

docker-clean: ## Clean up Docker images and containers
	docker-compose down --rmi all --volumes --remove-orphans
	docker rmi react-vite-app || true
	docker system prune -f
