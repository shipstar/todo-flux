TodoListItem = require './todo-list-item'

module.exports = React.createClass

  render: ->

    if @props.todos.length

      todos = _.map @props.todos, (todo) ->
        `<li><TodoListItem todo={todo} /></li>`

      `<ul id='todo-list'>{todos}</ul>`

    else

      `<span>No todos</span>`

