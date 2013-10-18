class TodoList.Routers.Items extends Backbone.Router
	routes:
		'': 'index'

	initialize: ->
		@collection = new TodoList.Collections.Items()
		@collection.fetch()

	index: ->
		view = new TodoList.Views.ItemsIndex(collection: @collection)
		$("#place-holder").html(view.render().el)