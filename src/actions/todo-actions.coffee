Dispatcher = require 'app/dispatcher'
TodoConstants = require 'app/constants/todo-constants'

module.exports =

  destroy: (id) ->

    Dispatcher.handleViewAction
      actionType: TodoConstants.TODO_DESTROY
      id: id

    # If there were a server, the above action could mark the item as pending
    # deletion or optimistically delete it while retaining a reference.

    # Then, we'd make a server call here and synchronize the store if needed.
