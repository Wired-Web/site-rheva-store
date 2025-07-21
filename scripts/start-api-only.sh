#!/bin/bash
echo "ADMIN_CORS=$ADMIN_CORS"
echo "STORE_CORS=$STORE_CORS"
echo "AUTH_CORS=$AUTH_CORS"
# API-only startup script for production
echo "🚀 Starting API-only production server..."

# Kill any existing process on port 9000
echo "🔍 Checking for existing processes on port 9000..."
EXISTING_PID=$(lsof -ti:9000)
if [ ! -z "$EXISTING_PID" ]; then
    echo "🔄 Killing existing process on port 9000 (PID: $EXISTING_PID)"
    kill -9 $EXISTING_PID
    sleep 2
fi

# Set production environment
export NODE_ENV=production
export ADMIN_DISABLED=true

# Set Node.js memory limits to prevent heap out of memory (increased to 4GB)
export NODE_OPTIONS="--max-old-space-size=4096"

# Run database migrations
echo "📊 Running database migrations..."
yarn medusa db:migrate

# Check if migrations succeeded
if [ $? -eq 0 ]; then
    echo "✅ Database migrations completed successfully"
    
    # Build backend only (admin is disabled)
    # echo "🔨 Building backend..."
    # yarn medusa build
    
    # Check if build succeeded
    # if [ $? -eq 0 ]; then
        echo "🚀 Starting Medusa API server..."
        yarn medusa start
    # else
    #     echo "❌ Backend build failed"
    #     exit 1
    # fi
else
    echo "❌ Database migrations failed"
    exit 1
fi 