import { SQLocalKysely } from "sqlocal/kysely";
import { Kysely, Migrator, sql } from "kysely";
import initSchema from "../../../schema/1_init_schema.sql?raw";
import seedDatabase from "../../../schema/2_seed_database.sql?raw";

// Initialize SQLocalKysely and pass the dialect to Kysely
const { dialect } = new SQLocalKysely("database.sqlite3");
import type { Database as IDatabase } from "./database.d";

const db = new Kysely<IDatabase>({ dialect });

const migrator = new Migrator({
  db,
  provider: {
    async getMigrations() {
      return {
        1: {
          up: async () => {
            await sql`${initSchema}`.execute(db);
            return Promise.resolve();
          },
        },
        2: {
          up: async () => {
            await sql`${seedDatabase}`.execute(db);
            return Promise.resolve();
          },
        },
      };
    },
  },
});

export { db, migrator };
