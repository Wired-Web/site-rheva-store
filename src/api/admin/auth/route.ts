import type { MedusaRequest, MedusaResponse } from "@medusajs/framework/http";

export async function OPTIONS(req: MedusaRequest, res: MedusaResponse) {
  const allowedOrigins = [
    "https://site-rheva-admin-guwc.vercel.app",
    "http://localhost:7001"
  ];
  
  const origin = req.headers.origin;
  if (origin && allowedOrigins.includes(origin)) {
    res.setHeader("Access-Control-Allow-Origin", origin);
    res.setHeader("Access-Control-Allow-Credentials", "true");
    res.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type,Authorization");
  }
  
  res.status(204).end();
} 