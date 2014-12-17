TodoStore = require 'app/stores/todo-store'

TodoList = require './todo-list'

getStoreState = ->
  todos: TodoStore.getAll()

App = React.createClass

  getInitialState: getStoreState

  componentDidMount: ->
    TodoStore.addChangeListener @_onChange

  componentWillUnmount: ->
    TodoStore.removeChangeListener @_onChange

  _onChange: ->
    @setState getStoreState()

  render: ->

    `<div>
      <h1>Todo List</h1>
      <TodoList todos={this.state.todos} />
    </div>`

React.render `<App />`, document.body
