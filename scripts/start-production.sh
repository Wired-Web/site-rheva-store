#!/bin/bash

# Production startup script
echo "🚀 Starting production deployment..."

# Set production environment
export NODE_ENV=production

# Run database migrations
echo "📊 Running database migrations..."
yarn medusa db:migrate

# Check if migrations succeeded
if [ $? -eq 0 ]; then
    echo "✅ Database migrations completed successfully"
    echo "🚀 Starting Medusa server..."
    yarn start
else
    echo "❌ Database migrations failed"
    exit 1
fi 