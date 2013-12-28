class Ponytail.Views.New extends Backbone.View
  events:
    "click .close": "closeNotice"
    "click .table_name": "clickTableName"
    "click .new_table": "clickNewTable"

  initialize: ->
    @tables = []

  render: =>
    for el in @$(".table")
      name = $(el).find('.table_name span').text()
      table = new Ponytail.Models.Table({name: name})
      new Ponytail.Views.Table({el: el, model: table})
      columns = []
      for el2 in $(el).find(".column")
        column_type = $(el2).find(".column_type span").text()
        column_name = $(el2).find(".column_name span").text()
        column = new Ponytail.Models.Column({table: table, type: column_type, name: column_name})
        new Ponytail.Views.Column({el: el2, model: column})
        columns.push(column)
      table.set({columns: columns}, {silent: true})
      @tables.push(table)

    class_name = @$(".classname input")[0].value
    @migrationFile = new Ponytail.Models.MigrationFile({className: class_name})
    new Ponytail.Views.MigrationFile({el: @$(".migration_file"), model: @migrationFile})
    @migrationFile.update()

    for table in @tables
      table.bind("change", =>
        @migrationFile.updateByTables(@tables)
      )
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

  clickNewTable: ->
    # TODO:
    alert("coming soon...")
    false
