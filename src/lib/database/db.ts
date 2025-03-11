import Database from "@tauri-apps/plugin-sql";
import {
  DummyDriver,
  Kysely,
  SqliteAdapter,
  SqliteIntrospector,
  SqliteQueryCompiler,
} from "kysely";
import type { Database as IDatabase } from "./database.d";

let client: Database | null;

const getClient = async () => {
  if (client) {
    return client;
  }
  client = await Database.load("sqlite:workouts.db");
  return client;
};

const db = new Kysely<IDatabase>({
  dialect: {
    createAdapter: () => new SqliteAdapter(),
    createDriver: () => new DummyDriver(),
    createIntrospector: (db) => new SqliteIntrospector(db),
    createQueryCompiler: () => new SqliteQueryCompiler(),
  },
});

export { db, getClient };
