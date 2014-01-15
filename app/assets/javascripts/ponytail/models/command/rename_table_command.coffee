class Ponytail.Models.RenameTableCommand
  constructor: (@tableName, @newName) ->

  toString: ->
    new Ponytail.Models.Command("rename_table", ":#{@tableName}", ":#{@newName}")
