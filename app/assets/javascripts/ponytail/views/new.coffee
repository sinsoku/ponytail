class Ponytail.Views.New extends Backbone.View
  events:
    "click .close": "closeNotice"
    "click .table_name": "clickTableName"

  render: =>
    for el in @$(".table")
      table = new Ponytail.Models.Table({})
      new Ponytail.Views.Table({el: el, model: table})
    @

  closeNotice: ->
    $(".notice").hide()
    false

  clickTableName: (e) ->
    tableElem = $(e.target).parent().parent()
    columnsElem = tableElem.find(".columns")
    if columnsElem.is(':visible')
      columnsElem.slideUp()
    else
      columnsElem.slideDown()
