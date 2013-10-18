class TodoList.Models.Item extends Backbone.Model
	
	toggleComplete: (status) ->
		@set completed: status
		item.save()
