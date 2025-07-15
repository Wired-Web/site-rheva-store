#!/bin/bash

# Development script - sets NODE_ENV to development
export NODE_ENV=development
echo "🚀 Starting in DEVELOPMENT mode"
echo "📊 Using local database: postgresql://localhost:5432/rheva_dev"
echo ""

# Run the original command with development environment
exec "$@" 