const defaultTheme = require('tailwindcss/defaultTheme')

/** @type {import('tailwindcss').Config} */
module.exports = {
  // Only bundle tailwind classes present in code
  mode: 'jit',
  // Search for tailwind classes in these files
  content: [
    './test/components/previews/**/*',
    './app/javascript/**/*',
    './app/components/**/*',
    './app/helpers/**/*',
    './app/views/**/*'
  ],
  theme: {
    fontFamily: {
      primary: ['Inter', ...defaultTheme.fontFamily.sans]
    }
  },
  variants: {},
  plugins: [
    // Tailwind Special Typography
    require('@tailwindcss/typography')
  ]
}
