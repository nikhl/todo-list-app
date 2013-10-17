class TodoList.Views.ItemsIndex extends Backbone.View

	_itemViews = {}

	template: JST['items/index']

	events:
		'submit #new_item': 'createItem'
		'click .delete_btn': 'deleteItem'
		'click input[name=\'complete\']': 'toggleCompleted'

	initialize: ->
		@collection.on("sync", @render, this)
		@collection.on("add", @appendItem, this)
		@collection.on("remove", @removeItemView, this)

	render: ->
		$(@el).html(@template())
		@collection.each(@appendItem)
		this

	appendItem: (item) ->
		view = new TodoList.Views.Item(model: item)
		_itemViews[item.get('id')] = view
		$('#items').append(view.render().el)

	createItem: (event) ->
		event.preventDefault()
		attrs = name: $('#new_item_name').val()
		@collection.create attrs,
			success: @clearItemName
			wait: true
			error: @handleError

	clearItemName: ->
		$('#new_item')[0].reset()

	handleError: (item, response) ->
		if response.status == 422
			errors = $.parseJSON(response.responseText).errors
			for attr, messages of errors
				alert "#{attr} #{message}" for message in messages

	deleteItem: (event) ->
		@collection.get($(event.currentTarget).data('id')).destroy()

	removeItemView: (item) ->
		_itemViews[item.get('id')].remove()

	toggleCompleted: (event) ->
		item = @collection.get($(event.currentTarget).data('id'))
		item.set 'completed': event.currentTarget.checked
		item.save()