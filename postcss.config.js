// Configuration reference:
// https://dev.to/vinbak/adding-tailwindcss-to-your-rails-project-with-postcss-7-compatibility-2o81
// Learn more about plugin needs:
// https://tailwindcss.com/docs/using-with-preprocessors
module.exports = {
  syntax: 'postcss-scss',
  plugins: [
    // Easy importing of local, node or web CSS files
    // (!) SET THIS PLUGIN ALWAYS FIRST
    // https://github.com/postcss/postcss-import
    require('postcss-import'),
    // Imports TailwindCSS
    require('tailwindcss')('./config/tailwind.config.js'),
    // Fixes bugs associated to flexboxes in different web browsers
    // https://www.npmjs.com/package/postcss-flexbugs-fixes
    require('postcss-flexbugs-fixes'),
    //
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
