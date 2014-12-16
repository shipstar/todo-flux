TodoStore = require 'app/stores/todo-store'

App = React.createClass

  getInitialState: ->
    todos: TodoStore.getAll()

  render: ->

    todos = if @state.todos.length
      @state.todos
    else
      "No todos"

    `<div>
      <h1>Todo List</h1>
      {todos}
    </div>`

React.render `<App />`, document.body
