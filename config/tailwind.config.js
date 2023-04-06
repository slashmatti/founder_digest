const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: { // custom color palette for branding
        'brand-blue': '#18327a',
        'brand-blue-dark': '#142962',
        'brand-orange': '#ee9343',
        'brand-orange-dark': '#c47937',
        'primary': '#249040',
        'primary-hover': {
          '700': '#217B38',
          '500': '#217B38'
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
