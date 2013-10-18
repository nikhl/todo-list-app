window.TodoList =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new TodoList.Routers.Items()
  	Backbone.history.start(pushState: true)

$(document).ready ->
  TodoList.initialize()
