import { defineConfig } from "drizzle-kit";
import { DBURL } from "./config";

export default defineConfig({
  out: "./drizzle",
  schema: "./schema.ts",
  dialect: "postgresql",
  dbCredentials: {
    url: DBURL,
  },
});
