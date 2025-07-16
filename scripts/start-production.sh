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
    
    # Run with more verbose logging
    yarn start 2>&1 | tee /tmp/medusa-startup.log
    
    # Capture the exit code
    exit_code=$?
    
    if [ $exit_code -ne 0 ]; then
        echo "❌ Medusa server failed to start (exit code: $exit_code)"
        echo "📋 Last 50 lines of startup log:"
        tail -50 /tmp/medusa-startup.log
        exit $exit_code
    fi
else
    echo "❌ Database migrations failed"
    exit 1
fi 