class TodoList.Views.Item extends Backbone.View

  template: JST['items/item']

  initialize: ->
  	@model.on('change', @render, this)

  render: ->
  	$(@el).html(@template(item: @model))
  	this
