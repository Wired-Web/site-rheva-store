import { defineMiddlewares } from "@medusajs/framework/http"
import type {
  MedusaRequest,
  MedusaResponse,
  MedusaNextFunction,
} from "@medusajs/framework/http"

// CORS middleware to ensure correct headers for all requests
async function corsMiddleware(
  req: MedusaRequest,
  res: MedusaResponse,
  next: MedusaNextFunction
) {
  console.log("CORS middleware running for", req.method, req.url);
  const allowedOrigins = [
    "https://site-rheva-admin-guwc.vercel.app",
    "http://localhost:8000"
    // Add other allowed origins if needed
  ];
  const origin = req.headers.origin;
  if (origin && allowedOrigins.includes(origin)) {
    res.setHeader("Access-Control-Allow-Origin", origin);
    res.setHeader("Access-Control-Allow-Credentials", "true");
    res.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type,Authorization");
  }
  // Respond to preflight OPTIONS requests immediately
  if (req.method === "OPTIONS") {
    res.status(200).end();
    return;
  }
  next();
}

export default defineMiddlewares({
  routes: [
    {
      matcher: /.*/,
      middlewares: [corsMiddleware],
    },
  ],
}); 