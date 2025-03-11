import { db, getClient } from "$lib/database/db";
import type { InferResult } from "kysely";

async function getExercises() {
  const client = await getClient();
  const query = db.selectFrom("exercise").select(["id", "name"]);
  const { sql } = query.compile();
  return await client.select<InferResult<typeof query>>(sql);
}

async function getEquipment() {
  const client = await getClient();
  const query = db.selectFrom("equipment").select(["id", "name"]);
  const { sql } = query.compile();
  return await client.select<InferResult<typeof query>>(sql);
}

async function getMuscles() {
  const client = await getClient();
  const query = db.selectFrom("muscle").select(["id", "name"]);
  const { sql } = query.compile();
  return await client.select<InferResult<typeof query>>(sql);
}

export { getEquipment, getExercises, getMuscles };
