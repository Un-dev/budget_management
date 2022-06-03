module.exports = {
  plugins: [
    require("autoprefixer"),
    require("tailwindcss"),
    require("postcss-import"),
    require("postcss-nested"),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
    }),
  ],
};
