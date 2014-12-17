{ Dispatcher } = require 'flux'

assign = require 'object-assign'

module.exports = assign new Dispatcher,

  handleViewAction: (action) ->
    console.warn "Handling ", action

    @dispatch
      source: 'VIEW_ACTION'
      action: action
