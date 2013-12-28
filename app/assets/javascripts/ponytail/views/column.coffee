class Ponytail.Views.Column extends Backbone.View
  events:
    "click .column_type": "clickColumnType"
    "change .column_type select": "changeColumnTypeSelect"
    "keyup .column_type select": "keyupColumnTypeSelect"
    "blur  .column_type": "blurColumnType"
    "click .column_name": "clickColumnName"
    "keyup .column_name input": "keyupColumnNameInput"
    "blur  .column_name": "blurColumnName"
    "click .remove_column": "clickRemoveColumn"
    "click .restore_column": "clickRestoreColumn"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    if @el.parentNode == null
      console.log("add column")
      # $(@el).html(_.template($("#column_template").html(), @model.attributes))
    else
      @$(".column_type span").text(@model.get("type"))
      @$(".column_name span").text(@model.get("name"))
    @

  clickColumnType: ->
    if @$(".column_type span").is(":visible")
      @$("option[value='#{@model.get("type")}']").attr("selected", true)
      @$(".column_type span").toggle()
      @$(".column_type select").toggle()

  changeColumnTypeSelect: (e) ->
    @model.set({type: e.target.value})

  keyupColumnTypeSelect: (e) ->
    # 13(ENTER_KEY)
    if e.which == 13
      @.blurColumnType()

  blurColumnType: ->
    if @$(".column_type select").is(":visible")
      @$(".column_type span").toggle()
      @$(".column_type select").toggle()

  clickColumnName: ->
    if @$(".column_name span").is(":visible")
      @$(".column_name span").toggle()
      @$(".column_name input").toggle()

  keyupColumnNameInput: (e) ->
    @model.set({name: e.target.value})
    # 13(ENTER_KEY)
    if e.which == 13
      @.blurColumnName()

  blurColumnName: ->
    if @$(".column_name input").is(":visible")
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
