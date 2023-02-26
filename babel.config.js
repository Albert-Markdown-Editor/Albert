const presets = [
  [
    // Javascript 2015+ syntax transpiler
    '@babel/preset-env',
    // Javascript Polyfill
    {
      useBuiltIns: 'usage',
      corejs: '3.28.0'
    }
  ]
]

module.exports = {
  presets,
  // Fixes Core-JS $ issue: https://github.com/zloirock/core-js/issues/912
  exclude: ['./node_modules']
}
