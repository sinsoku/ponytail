class Ponytail.Views.Column extends Backbone.View
  events:
    "click .remove_column": "clickRemoveColumn"
    "click .restore_column": "clickRestoreColumn"

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
