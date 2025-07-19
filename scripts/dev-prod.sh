#!/bin/bash

# Dev-prod: Local dev mode with remote (production) database

# Load production environment variables
if [ -f .env.production ]; then
    echo "📄 Loading .env.production file..."
    export $(cat .env.production | grep -v '^#' | xargs)
else
    echo "⚠️  Warning: .env.production file not found"
fi

# Set development environment (for local dev features)
export NODE_ENV=development

# Set production database URL with SSL mode
export DATABASE_URL="postgresql://rheva:94FbnY0wtLKatWAToXagSSOxD@dpg-d1r5mrur433s739t3s4g-a.frankfurt-postgres.render.com/rheva_db?sslmode=require"

# Use production database from .env.production
echo "🚀 Starting in DEV-PROD mode: Local dev, admin enabled, using remote DB"
echo "📊 Connecting to remote database: $DATABASE_URL"
echo "🟢 Admin interface ENABLED (hot reload)"
echo ""

# Run Medusa in development mode (hot reload, admin enabled)
yarn medusa develop 