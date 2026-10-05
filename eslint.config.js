import { includeIgnoreFile } from "@eslint/compat";
import js from "@eslint/js";
import prettier from "eslint-config-prettier";
import reactHooks from "eslint-plugin-react-hooks";
import globals from "globals";
import { fileURLToPath } from "node:url";
import ts from "typescript-eslint";
const gitignorePath = fileURLToPath(new URL("./.gitignore", import.meta.url));

export default ts.config(
  includeIgnoreFile(gitignorePath),
  js.configs.recommended,
  ...ts.configs.recommended,
  reactHooks.configs.flat["recommended-latest"],
  prettier,
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
  },
  {
    ignores: ["src-tauri/*", "src/routeTree.gen.ts", "src/lib/eb/*"],
  },
);
