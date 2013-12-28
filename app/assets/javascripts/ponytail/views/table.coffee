class Ponytail.Views.Table extends Backbone.View
  events:
    "click .edit_table": "clickEditTable"
    "keyup .table_name input": (e) ->
      @model.set({name: e.target.value})
    "blur  .table_name input": "blurTableName"
    "click .drop_table": "clickDropTable"
    "click .restore_table": "clickRestoreTable"
    "click .add_column": "clickAddColumn"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    @$(".table_name span").text(@model.get("name"))

  clickEditTable: ->
    if @$(".table_name span").is(":visible")
      @$(".table_name span").toggle()
      @$(".table_name input").toggle()
    false

  blurTableName: (e) ->
    @model.set({name: e.target.value})
    @$(".table_name span").toggle()
    @$(".table_name input").toggle()

  clickDropTable: ->
    @model.set({isDrop: true})
    @$(".drop_table").hide()
    @$(".restore_table").show()
    false

  clickRestoreTable: ->
    @model.set({isDrop: false})
    @$(".drop_table").show()
    @$(".restore_table").hide()
    false

  clickAddColumn: ->
    # TODO:
    alert("coming soon...")
    false
