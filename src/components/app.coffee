React = require 'react/lib/reactWithAddons'

moment = require 'moment'

Form = React.createClass

  mixins: [React.addons.LinkedStateMixin]

  getInitialState: ->
    date: moment().format('YYYY-MM-DD')
    time: moment().format('HH:MM')
    description: ""
    carby: false

  onSubmit: (e) ->

    e.preventDefault()

    @props.onSubmit
      date: moment(@state.date).format('M/D/YY')
      time: moment(@state.time, 'HH:mm').format('h:m a')
      description: @state.description
      carby: @state.carby

    @replaceState @getInitialState()

  render: ->

    `<form onSubmit={this.onSubmit}>
      <div className='form-group'>
        <label>Date</label>
        <input type="date" className="form-control" valueLink={this.linkState('date')} />
      </div>

      <div className='form-group'>
        <label>Time</label>
        <input type="time" className="form-control" valueLink={this.linkState('time')} />
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
      date: moment().format('M/D/YY')
      time: moment().format('h:m a')
      description: "3x fun-size Snickers"
      carby: true
    ,
      id: 2
      date: moment().subtract(6, 'hours').format('M/D/YY')
      time: moment().subtract(6, 'hours').format('h:m a')
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
      {entry.date} {entry.time}
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
