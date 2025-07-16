#!/bin/bash

# Production script - sets NODE_ENV to production
export NODE_ENV=production
echo "🚀 Starting in PRODUCTION mode"
echo "📊 Using Render database: postgresql://rheva:6BFbiFFBGMeUjnqz05s16TIWrnFPuZHM@dpg-d1r5mrur433s739t3s4g-a/rheva_db"
echo ""

# Run the original command with production environment
exec "$@" 