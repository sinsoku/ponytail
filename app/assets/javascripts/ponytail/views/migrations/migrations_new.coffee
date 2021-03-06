class Ponytail.Views.MigrationsNew extends Backbone.View
  events:
    "click .close a": "closeNotice"
    "click .table_name": "clickTableName"
    "click .new_table": "clickNewTable"

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

        name = @$(".classname input")[0].value
        @migration = new Ponytail.Models.Migration({name: name})
        new Ponytail.Views.PreviewCreateFile({el: @$(".migration_file"), model: @migration})
        @migration.update()

        for table in @tables
          table.bind("change", =>
            @migration.updateByTables(@tables)
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
      @migration.updateByTables(@tables)
    )
    table.trigger("change")

    view = new Ponytail.Views.Table({model: table})
    @$(".new_table").before(view.render().el)
    false
