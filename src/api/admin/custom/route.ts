import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http";

export async function GET(
  req: MedusaRequest,
  res: MedusaResponse
) {
  res.sendStatus(200);
}

export async function OPTIONS(
  req: MedusaRequest,
  res: MedusaResponse
) {
  res.sendStatus(200);
}
