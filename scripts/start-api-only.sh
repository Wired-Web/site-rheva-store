#!/bin/bash

# API-only startup script for production
echo "🚀 Starting API-only production server..."

# Set production environment
export NODE_ENV=production
export ADMIN_DISABLED=true

# Run database migrations
echo "📊 Running database migrations..."
yarn medusa db:migrate

# Check if migrations succeeded
if [ $? -eq 0 ]; then
    echo "✅ Database migrations completed successfully"
    
    # Build backend only (admin is disabled)
    echo "🔨 Building backend..."
    yarn medusa build
    
    echo "🚀 Starting Medusa API server..."
    yarn medusa start
else
    echo "❌ Database migrations failed"
    exit 1
fi 