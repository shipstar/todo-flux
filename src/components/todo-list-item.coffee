TodoActions = require 'app/actions/todo-actions'

module.exports = React.createClass

  delete: -> TodoActions.destroy @props.todo.id

  render: ->

    `<div>
      <span>{this.props.todo.text}</span>
      <button onClick={this.delete}>X</button>
    </div>`
