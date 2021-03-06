const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  mode: "jit",
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/**/*.html.erb",
    "./app/views/**/*",
    "./src/**/*.{html,js}",
  ],
  theme: {
    backdropFilter: {
      none: "none",
      blur: "blur(20px)",
    },
    extend: {
      colors: {
        primary: { DEFAULT: "#2A7347" },
      },
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("tailwindcss-filters"),
  ],
};
