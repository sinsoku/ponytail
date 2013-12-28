class Ponytail.Views.NewMigrationView extends Backbone.View
  events:
    "click .pt_new_table a": "appendTableView"

  initialize: ->
    tables = []
    $(".pt_table").each( ->
      name = @$.find(".pt_table_name span").text()
      m = new Ponytail.Models.Table({name: name})
      tables.push(m)
      new Ponytail.Views.TableView({el: @$, model: m})
    )

    migrationFile = new Ponytail.Models.MigrationFile()
    new Ponytail.Views.MigrationFileView({el: $(".migration_file_view"), model: migrationFile})
    tables.forEach((table) ->
      table.bind("change", ->
        migrationFile.updateByTables(tables)
      )
    )

    @tables = tables
    @migrationFile = migrationFile

  appendTableView: ->
    tables = @tables
    migrationFile = @migrationFile
    m = new Ponytail.Models.Table({isCreated: true})
    tables.push(m)
    m.bind("change", ->
      migrationFile.updateByTables(tables)
    )

    m.trigger("change")
    v = new Ponytail.Views.TableView({model: m})
    $(".pt_new_table").before(v.render().el)
    false
