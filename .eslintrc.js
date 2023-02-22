module.exports = {
  env: {
    browser: true,
    es2021: true
  },
  parser: '@babel/eslint-parser',
  extends: ['standard'],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    indent: ['error', 'tab'],
    'linebreak-style': ['error', 'unix'],
    quotes: ['error', 'double'],
    semi: ['error', 'never']
  },
  rules: {
    'space-before-function-paren': 'off'
  }
}
