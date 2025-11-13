# Development-friendly Dockerfile for Next.js
# Builds image with node_modules installed, but in dev mode we mount the host source
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Install dependencies first (cache layer)
COPY package.json package-lock.json* ./
RUN npm ci

# Copy rest of the project (for production builds)
COPY . .

EXPOSE 3000

# Default to dev server. docker-compose can override command for prod.
CMD ["npm", "run", "dev"]
