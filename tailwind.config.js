module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        mytheme: {
          // 用意されている各種の色も設定できる
          primary: "#5c7b64", // btn-primaryなどの背景の色
          "primary-content": "#ffffff", // btn-primaryなどの文字の色
          "base-100": "#ffecd4", // 全体の背景色
          "base-content": "#372f38", // 全体の文字の色
        },
      }
    ],
  },
}
