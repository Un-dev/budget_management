const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  mode: "jit",
  purge: {
    content: ["./public/**/*.html", "./src/**/*.{js,jsx,ts,tsx,vue}"],
    options: {
      safelist: ["bg-primary"],
    },
  },
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
  ],
  theme: {
    backdropFilter: {
      none: "none",
      blur: "blur(20px)",
    },
    colors: {
      primary: { DEFAULT: "#2B8A44" },
    },
    extend: {
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
