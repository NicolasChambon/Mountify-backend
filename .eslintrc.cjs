module.exports = {
  env: {
    node: true,
    es6: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:import/errors",
    "plugin:import/warnings",
    "plugin:node/recommended",
    "plugin:security/recommended-legacy",
    "plugin:prettier/recommended",
  ],
  plugins: ["unused-imports", "sequelize"],
  rules: {
    "unused-imports/no-unused-imports": "error",
    "prettier/prettier": "error",
    "sequelize/create-indexes-concurrently": "error",
    "node/exports-style": ["error", "module.exports"],
    "node/file-extension-in-import": ["error", "always"],
    "node/prefer-global/buffer": ["error", "always"],
    "node/prefer-global/console": ["error", "always"],
    "node/prefer-global/process": ["error", "always"],
    "node/prefer-global/url-search-params": ["error", "always"],
    "node/prefer-global/url": ["error", "always"],
    "node/prefer-promises/dns": "error",
    "node/prefer-promises/fs": "error",
  },
  parserOptions: {
    ecmaVersion: 2021,
    sourceType: "module",
  },
};
