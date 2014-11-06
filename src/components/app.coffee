React = require 'react/lib/reactWithAddons'
moment = require 'moment'

module.exports = React.createClass

  getInitialState: ->
    entries: [
      time: moment()
      description: "3x fun-size Snickers"
      carby: true
    ,
      time: moment().subtract(6, 'hours')
      description: "Grilled chicken and vegetables"
      carby: false
    ]

  addEntry: (e) ->
    e.preventDefault()

    console.warn 'adding'

  renderEntry: (entry) ->

    style =
      'color': if entry.carby then 'darkred' else 'green'

    `<li style={style}>
      {entry.time.format('M/D h:mm a')}
      &mdash;
      {entry.description}
      &mdash;
      {entry.carby ? 'x' : '√'}
    </li>`

  render: ->

    `<div>
      <h1>Carby</h1>

      {this.state.entries.map(this.renderEntry)}

      <form onSubmit={this.addEntry}>
        <div className='form-group'>
          <label>Description</label>
          <input className="form-control" />
        </div>

        <button type="submit" class="btn btn-default">Add entry</button>
      </form>
    </div>`
