module.exports = {
  parser: "postcss-scss",
  plugins: [
    require("postcss-import"),
    require("tailwindcss/nesting"),
    require("tailwindcss")("./app/assets/stylesheets/tailwind.config.js"),
    require("autoprefixer"),
  ],
};
