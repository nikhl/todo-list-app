window.TodoList =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new TodoList.Routers.Items()
  	Backbone.history.start()

$(document).ready ->
  TodoList.initialize()
