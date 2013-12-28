class Ponytail.Views.Table extends Backbone.View
  events:
    "click .drop_table": "clickDropTable"
    "click .restore_table": "clickRestoreTable"

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
