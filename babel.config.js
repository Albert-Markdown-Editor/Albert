const presets = [
  [
    '@babel/preset-env',
    {
      useBuiltIns: 'usage',
      corejs: '3.24.1'
    }
  ]
]

module.exports = {
  presets,
  // Excludes Core-JS from Babel. Fixes https://github.com/zloirock/core-js/issues/912
  exclude: [/\bcore-js\b/]
}
