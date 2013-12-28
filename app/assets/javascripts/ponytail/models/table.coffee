class Ponytail.Models.Table extends Backbone.Model
  defaults:
    name: "new_table"
    columns: []
    isDrop: false
    isCreated: false

  initialize: (attrs, options) ->
    @beforeName = attrs.name || ""

  isCreated: ->
    @.get("isCreated") == true

  isDrop: ->
    @.get("isDrop") == true

  isRename: ->
    @.beforeName != @.get("name")

  addColumn: (column) ->
    columns = @.get("columns")
    columns.push(column)
    @.set({columns: columns})
    @.trigger("change")

  getCommands: ->
    if (@.isCreated() && @.isDrop())
      []
    else if (@.isCreated() && !@.isDrop())
      [new Ponytail.Models.CreateTableCommand(@.get("name"), @.get("columns"))]
    else if (!@.isCreated() && @.isDrop())
      [new Ponytail.Models.DropTableCommand(@.beforeName)]
    else
      commands = []
      if @.isRename()
        commands.push(new Ponytail.Models.RenameTableCommand(@beforeName, @.get("name")))

      @.get("columns").forEach((column) ->
        commands.push(column.getCommands())
      )

      _.compact(_.flatten(commands))
