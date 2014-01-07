class Ponytail.Views.MigrationsNew extends Backbone.View
  events:
    "click .close a": "closeNotice"
    "click .table_name": "clickTableName"
    "click .new_table a": "clickNewTable"

  initialize: ->
    @tables = []

  render: =>
    schema = new Ponytail.Models.Schema()
    schema.fetch
      success: =>
        for table_attrs in schema.get('tables')
          m = new Ponytail.Models.Table(table_attrs)
          v = new Ponytail.Views.Table({model: m})
          @$(".new_table").before(v.render().el)
          @tables.push(m)

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
    table = new Ponytail.Models.Table({isCreated: true})
    @tables.push(table)
    table.bind("change", =>
      @migrationFile.updateByTables(@tables)
    )
    table.trigger("change")

    view = new Ponytail.Views.Table({model: table})
    @$(".new_table").before(view.render().el)
    false
