const purgecss = require('@fullhuman/postcss-purgecss')({
  content: [
    './app/views/**/*.html.erb'
  ]
})

module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('tailwindcss')('./app/javascript/css/tailwind.js'),
    require('autoprefixer'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
    ...process.env.NODE_ENV === 'production'
      ? [purgecss]
      : []
  ]
}
