React = require 'react/lib/reactWithAddons'
App = require './components/app'

document.write '<div id="container"></div>'

React.renderComponent App(), document.getElementById('container')
