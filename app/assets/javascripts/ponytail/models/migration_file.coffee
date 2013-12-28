class Ponytail.Models.MigrationFile extends Backbone.Model
  defaults:
    className: ""
    rawContent: ""

  initialize: (attrs, options) ->
    @tables = []
    @.bind("change:className", @.update)

  updateByTables: (tables) ->
    @tables = tables
    @.update()

  update: =>
    rawContent = [
      "class #{@.get("className")} < ActiveRecord::Migration",
      @.getContentOfClass(),
      "end",
    ].join("\n")
    @.set({rawContent: rawContent})

  getContentOfClass: ->
    _.compact([
      "def change",
      @.getStringOfCommands(),
      "end",
    ]).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  ")

  getStringOfCommands: ->
    commands = @.getCommands()
    commands.map((command) ->
      command.toString()
    ).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  ")

  getCommands: ->
    _.flatten(@tables.map((table) ->
      table.getCommands()
    ))
