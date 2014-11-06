webpack = require 'webpack'

module.exports =

  devtool: 'source-map'

  entry: [
    'webpack/hot/only-dev-server'
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

    new webpack.NoErrorsPlugin()
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
