React = require 'react/lib/reactWithAddons'

moment = require 'moment'

Form = React.createClass

  mixins: [React.addons.LinkedStateMixin]

  getInitialState: ->
    time: null
    description: ""
    carby: false

  onSubmit: (e) ->

    e.preventDefault()

    @props.onSubmit
      time: moment()
      description: @state.description
      carby: @state.carby

    @replaceState @getInitialState()

  render: ->

    `<form onSubmit={this.onSubmit}>
      <div className='form-group'>
        <label>Time</label>
        <input type="datetime" className="form-control" valueLink={this.linkState('time')} />
      </div>

      <div className='form-group'>
        <label>Description</label>
        <input className="form-control" valueLink={this.linkState('description')} />
      </div>

      <div className="checkbox">
        <label>
          <input type="checkbox" checkedLink={this.linkState('carby')} /> Carby?
        </label>
      </div>

      <button type="submit" className="btn btn-default">Add entry</button>
    </form>`

module.exports = React.createClass

  getInitialState: ->
    lastId: 3

    entries: [
      id: 1
      time: moment()
      description: "3x fun-size Snickers"
      carby: true
    ,
      id: 2
      time: moment().subtract(6, 'hours')
      description: "Grilled chicken and vegetables"
      carby: false
    ]

  addEntry: (entry) ->
    entry.id = @state.lastId++

    @setState
      entries: @state.entries.concat([entry])

  renderEntry: (entry) ->

    style =
      'color': if entry.carby then 'darkred' else 'green'

    `<li style={style} key={entry.id}>
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

      <Form onSubmit={this.addEntry} />
    </div>`
