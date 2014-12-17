Dispatcher = require 'app/dispatcher'
TodoConstants = require 'app/constants/todo-constants'

assign = require 'object-assign'

{ EventEmitter } = require 'events'

CHANGE_EVENT = 'change'

_todos = [
  id: 1
  text: 'foo'
,
  id: 2
  text: 'bar'
,
  id: 3
  text: 'baz'
]

destroy = (id) ->
  _todos = _.reject _todos, (todo) -> todo.id is id

TodoStore = assign {}, EventEmitter.prototype,

  getAll: -> _todos

  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback

Dispatcher.register (payload) ->
  console.warn "TodoStore handling ", payload

  action = payload.action

  switch action.actionType
    when TodoConstants.TODO_DESTROY
      destroy action.id

  TodoStore.emitChange()

module.exports = TodoStore
