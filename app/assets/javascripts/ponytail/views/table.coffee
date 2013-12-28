class Ponytail.Views.Table extends Backbone.View
  events:
    "click .drop_table": "clickDropTable"
    "click .restore_table": "clickRestoreTable"
    "click .add_column": "clickAddColumn"

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
