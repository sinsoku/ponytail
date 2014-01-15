class Ponytail.Models.DropTableCommand
  constructor: (@tableName) ->

  toString: ->
    new Ponytail.Models.Command("drop_table", ":#{@tableName}")
