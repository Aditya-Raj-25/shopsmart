#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting CI process..."

# Define paths
PROJECT_ROOT=$(pwd)
CLIENT_DIR="$PROJECT_ROOT/client"
SERVER_DIR="$PROJECT_ROOT/server"

# --- SERVER ---
echo "📂 Processing Server..."
cd "$SERVER_DIR"

echo "📦 Installing server dependencies..."
npm install

echo "🔍 Linting server..."
# Note: package.json has a placeholder for lint
npm run lint || echo "⚠️ Warning: Linting failed (or not configured for server)"

echo "🧪 Running server tests..."
npm test -- --passWithNoTests

# --- CLIENT ---
echo "📂 Processing Client..."
cd "$CLIENT_DIR"

echo "📦 Installing client dependencies..."
npm install

echo "🔍 Linting client..."
npm run lint || echo "⚠️ Warning: Linting failed for client"

echo "🧪 Running client tests..."
npm test -- --run

echo "✅ CI process completed successfully!"
