React = require 'react/lib/reactWithAddons'
App = require './components/app'

window._ = require 'underscore'

document.write '<div id="container"></div>'

React.render `<App />`, document.getElementById('container')
