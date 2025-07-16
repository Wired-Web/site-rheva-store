#!/bin/bash

# Production script - sets NODE_ENV to production
export NODE_ENV=production
echo "🚀 Starting in PRODUCTION mode"
echo "📊 Using Render database"
echo ""

# Run the original command with production environment
exec "$@" 
