module.exports = {
  env: {
    browser: true,
    node: true,
    es2021: true
  },
  extends: ['prettier', 'eslint:recommended'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2021,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true
    }
  },
  plugins: ['prettier'],
  rules: {
    'prettier/prettier': 1,
    'no-console': 1,
    'react/prop-types': 0
  }
}
