React = require 'react/lib/reactWithAddons'
moment = require 'moment'

module.exports = React.createClass

  getInitialState: ->
    entries: [
      time: moment()
      description: "3x fun-size Snickers"
      carby: true
    ]

  addEntry: (e) ->
    e.preventDefault()

    console.warn 'adding'

  render: ->

    `<div>
      <h1>Carby</h1>

      <form onSubmit={this.addEntry}>
        <div class='form-group'>
          <label>Description</label>
          <input className="form-control" />
        </div>

        <button type="submit" class="btn btn-default">Add entry</button>
      </form>
    </div>`
