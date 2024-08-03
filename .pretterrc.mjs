// .prettierrc.mjs
/** @type {import("prettier").Config} */
export default {
  plugins: [
    "prettier-plugin-astro",
    "prettier-plugin-tailwindcss",
    "prettier-plugin-organize-imports",
  ],
  overrides: [
    {
      excludeFiles: ["pnpm-lock.yaml"],
      files: "*.astro",
      options: {
        parser: "astro",
      },
    },
  ],
};
