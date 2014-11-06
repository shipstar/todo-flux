webpack = require 'webpack'

module.exports =

  entry: ['./src/main.coffee']

  output:
    path: './public/resources/'
    filename: 'bundle.js'

  module:
    loaders: [
      test: /\.coffee$/
      loader: 'jsx!coffee'
    ]

  resolve:
    extensions: [
      ''
      '.js'
      '.coffee'
      '.css'
    ]

# var webpack = require('webpack');

# module.exports = {
#     entry: [
#         "webpack/hot/dev-server",
#         "./entry.coffee"
#     ],
#     output: {
#         path: __dirname,
#         filename: "bundle.js"
#     },
#     module: {
#         loaders: [
#             { test: /\.css$/, loader: "style!css" },
#             { test: /\.coffee$/, loader: "react-hot!jsx!coffee" }
#         ]
#     },
#     plugins: [
#         new webpack.HotModuleReplacementPlugin()
#     ],
#     resolve: {
#         extensions: ['', '.js', '.coffee', '.css']
#     },
#     devServer: {
#         hot: true
#     }
# };
