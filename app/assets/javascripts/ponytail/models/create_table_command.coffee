class Ponytail.Models.CreateTableCommand
  constructor: (@tableName, @columns) ->

  toString: ->
    return [
        "create_table :#{@tableName} do |t|",
        @columns.map((column) ->
          "t.#{column.get("type")} :#{column.get("name")}"
        ).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  "),
        "  t.timestamps",
        "end",
      ].join("\n")
