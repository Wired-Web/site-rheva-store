# Environment Configuration

This project supports separate database configurations for local development and production environments.

## Environment Files

- `.env.development` - Local development settings (uses local PostgreSQL)
- `.env.production` - Production settings (uses Render PostgreSQL)

## Quick Start

### Local Development
```bash
# Start development server with local database
yarn dev:local

# Or start production server with local database
yarn start:local
```

### Production
```bash
# Start development server with production database
yarn dev:prod

# Or start production server with production database
yarn start:prod
```

## Database URLs

### Local Development
- **Database**: `postgresql://localhost:5432/rheva_dev`
- **Redis**: `redis://localhost:6379`

### Production (Render)
- **Database**: `postgresql://rheva:6BFbiFFBGMeUjnqzO5s16TlWRnFPuZHM@dpg-d1r5mrur433s739t3s4g-a/rheva_db`
- **Redis**: `redis://localhost:6379` (update this for production Redis)

## Manual Environment Switching

You can also manually set the environment:

```bash
# For local development
export NODE_ENV=development
yarn dev

# For production
export NODE_ENV=production
yarn dev
```

## Environment File Structure

Both `.env.development` and `.env.production` contain:

```env
MEDUSA_ADMIN_ONBOARDING_TYPE=nextjs
STORE_CORS=http://localhost:8000,https://docs.medusajs.com
ADMIN_CORS=http://localhost:5173,https://docs.medusajs.com
AUTH_CORS=http://localhost:5173,http://localhost:9000,http://localhost:8000,https://docs.medusajs.com
REDIS_URL=redis://localhost:6379
JWT_SECRET=supersecret
COOKIE_SECRET=supersecret
DATABASE_URL=<environment-specific-url>
MEDUSA_ADMIN_ONBOARDING_NEXTJS_DIRECTORY=site-rheva-store-storefront
```

## Security Notes

- Environment files (`.env.development`, `.env.production`) are gitignored
- Never commit sensitive database credentials to version control
- Update production secrets in your deployment platform (Render, etc.) 