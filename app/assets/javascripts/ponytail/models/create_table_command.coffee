class Ponytail.Models.CreateTableCommand
  constructor: (@tableName, @columns) ->

  toString: ->
    column_defs = ("t.#{column.get("type")} :#{column.get("name")}" for column in @columns)
    return [
        "create_table :#{@tableName} do |t|",
        column_defs.join("\n").replace(/^/, "  ").replace(/\n/g, "\n  "),
        "  t.timestamps",
        "end",
      ].join("\n")
