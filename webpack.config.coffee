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
      { test: /\.jsx$/, loader: 'jsx?insertPragma=React.DOM&harmony' }
      { test: /\.js$/, loader: 'jsx?harmony' },
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
