class Ponytail.Models.Table extends Backbone.Model
  defaults:
    name: "new_table"
    columns: []
    indexes: []

  initialize: (attrs) ->
    @attributes.isDrop = attrs.isDrop || false
    @attributes.isCreated = attrs.isCreated || false
    @beforeName = attrs.name || ""

  isCreated: ->
    @get("isCreated") == true

  isDrop: ->
    @get("isDrop") == true

  isRename: ->
    @beforeName != @get("name")

  addColumn: (column) ->
    columns = @get("columns")
    columns.push(column)
    @set({columns: columns})
    @trigger("change")

  getCommands: ->
    if (@isCreated() && @isDrop())
      []
    else if (@isCreated() && !@isDrop())
      columns = (column for column in @get("columns") when !column.isRemoved())
      [new Ponytail.Models.CreateTableCommand(@get("name"), columns)]
    else if (!@isCreated() && @isDrop())
      [new Ponytail.Models.DropTableCommand(@beforeName)]
    else
      commands = []
      if @isRename()
        commands.push(new Ponytail.Models.RenameTableCommand(@beforeName, @get("name")))

      for column in @get("columns")
        commands.push(column.getCommands())

      _.compact(_.flatten(commands))
