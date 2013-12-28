class Ponytail.Views.Column extends Backbone.View
  events:
    "click .column_type": "clickColumnType"
    "blur  .column_type": "blurColumnType"
    "click .column_name": "clickColumnName"
    "keyup .column_name input": (e) ->
      @model.set({name: e.target.value})
    "blur  .column_name": "blurColumnName"
    "click .remove_column": "clickRemoveColumn"
    "click .restore_column": "clickRestoreColumn"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    @$(".column_type span").text(@model.get("type"))
    @$(".column_name span").text(@model.get("name"))

  clickColumnType: ->
    if @$(".column_type span").is(":visible")
      @$("option[value='#{@model.get("type")}']").attr("selected", true)
      @$(".column_type span").toggle()
      @$(".column_type select").toggle()

  blurColumnType: (e) ->
    @model.set({type: e.target.value})
    @$(".column_type span").toggle()
    @$(".column_type select").toggle()

  clickColumnName: ->
    if @$(".column_name span").is(":visible")
      @$(".column_name span").toggle()
      @$(".column_name input").toggle()

  blurColumnName: (e) ->
    @$(".column_name span").toggle()
    @$(".column_name input").toggle()

  clickRemoveColumn: ->
    @model.set({isRemoved: true})
    @$(".remove_column").hide()
    @$(".restore_column").show()
    false

  clickRestoreColumn: ->
    @model.set({isRemoved: false})
    @$(".remove_column").show()
    @$(".restore_column").hide()
    false
