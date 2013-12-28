class Ponytail.Views.Table extends Backbone.View
  events:
    "click .edit_table": "clickEditTable"
    "click .drop_table": "clickDropTable"
    "click .restore_table": "clickRestoreTable"
    "click .add_column": "clickAddColumn"

  clickEditTable: ->
    false

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
