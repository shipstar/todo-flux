TodoStore = require 'app/stores/todo-store'

TodoList = require './todo-list'

App = React.createClass

  getInitialState: ->
    todos: TodoStore.getAll()

  render: ->

    `<div>
      <h1>Todo List</h1>
      <TodoList todos={this.state.todos} />
    </div>`

React.render `<App />`, document.body
