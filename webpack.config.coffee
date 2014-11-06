webpack = require 'webpack'

module.exports =

  entry: [
    'webpack/hot/dev-server'
    './src/main.coffee'
  ]

  output:
    path: './public/resources/'
    filename: 'bundle.js'

  module:
    loaders: [
      { test: /\.coffee$/, loader: 'react-hot!jsx!coffee' }
    ]

  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]

  resolve:
    extensions: [
      ''
      '.js'
      '.coffee'
      '.css'
    ]

  devServer:
    hot: true
