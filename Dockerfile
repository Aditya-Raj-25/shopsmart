# Stage 1: Build the client
FROM node:18-alpine AS client-builder
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

# Stage 2: Build the server
FROM node:18-alpine AS server-builder
WORKDIR /app/server
COPY server/package*.json ./
RUN npm install
COPY server/ ./

# Stage 3: Final Production Image
FROM node:18-alpine
WORKDIR /app

# Copy server files
COPY --from=server-builder /app/server ./server

# Copy built client assets to the server's public folder
COPY --from=client-builder /app/client/dist ./server/public

# Set working directory to server for execution
WORKDIR /app/server

# Expose the server port
EXPOSE 5001

# Start the server
CMD ["npm", "start"]
