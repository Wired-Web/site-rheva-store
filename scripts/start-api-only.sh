#!/bin/bash

# API-only startup script for production
echo "🚀 Starting API-only production server..."

# Set production environment
export NODE_ENV=production

# Run database migrations
echo "📊 Running database migrations..."
yarn medusa db:migrate

# Check if migrations succeeded
if [ $? -eq 0 ]; then
    echo "✅ Database migrations completed successfully"
    echo "🚀 Starting Medusa API server..."
    
    # Run in production mode
    yarn medusa start
else
    echo "❌ Database migrations failed"
    exit 1
fi 