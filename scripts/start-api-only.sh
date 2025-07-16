#!/bin/bash

# API-only startup script for production
echo "🚀 Starting API-only production server..."

# Set production environment
export NODE_ENV=production
export MEDUSA_DISABLE_ADMIN=true
export MEDUSA_ADMIN_ONBOARDING_TYPE=cli

# Run database migrations
echo "📊 Running database migrations..."
yarn medusa db:migrate

# Check if migrations succeeded
if [ $? -eq 0 ]; then
    echo "✅ Database migrations completed successfully"
    echo "🚀 Starting Medusa API server..."
    
    # Run in development mode but with production env vars
    # This works around the admin build issue in production mode
    yarn medusa develop
else
    echo "❌ Database migrations failed"
    exit 1
fi 