webpack = require 'webpack'
path = require 'path'

module.exports =

  devtool: 'source-map'

  entry: [
    'webpack/hot/only-dev-server'
    'app/components/app.coffee'
  ]

  output:
    path: './public/resources/'
    filename: 'bundle.js'

  module:
    loaders: [
      { test: /\.coffee$/, loader: 'react-hot!jsx!coffee' }
      { test: /\.jsx$/, loader: 'jsx?insertPragma=React.DOM&harmony' }
      { test: /\.js$/, loader: 'jsx?harmony' }
    ]

  plugins: [
    new webpack.HotModuleReplacementPlugin()

    new webpack.NoErrorsPlugin()

    new webpack.ProvidePlugin
      _: 'underscore'
      React: 'react'
  ]

  resolve:
    alias:
      app: path.join(__dirname, 'src')

    extensions: [
      ''
      '.js'
      '.coffee'
      '.css'
    ]

  devServer:
    hot: true
