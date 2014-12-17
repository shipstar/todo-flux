TodoActions = require 'app/actions/todo-actions'

ENTER_KEY_CODE = 13

module.exports = React.createClass

  getInitialState: ->
    value: ''

  onChange: (e) ->
    @setState
      value: e.target.value

  onKeyDown: (e) ->
    if e.keyCode is ENTER_KEY_CODE
      @save()

  save: ->
    text = @state.value

    if text.trim()
      TodoActions.create(text)

      @setState value: ''

  render: ->

    `<input
      placeholder='New todo'
      value={this.state.value}
      onChange={this.onChange}
      onKeyDown={this.onKeyDown} />`
