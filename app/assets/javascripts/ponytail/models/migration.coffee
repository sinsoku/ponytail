class Ponytail.Models.Migration extends Backbone.Model
  defaults:
    filename: ""
    name: ""
    raw_content: ""
    version: 0

  initialize: (attrs, options) ->
    @tables = []
    @attributes["basename"] = @basename()
    @bind("change:name", @update)

  basename: ->
    filename = @get("filename")
    if filename
      filename.split('/').pop()

  updateByTables: (tables) ->
    @tables = tables
    @update()

  update: =>
    rawContent = [
      "class #{@get("name")} < ActiveRecord::Migration",
      @getContentOfClass(),
      "end",
    ].join("\n")
    @set({raw_content: rawContent})

  getContentOfClass: ->
    _.compact([
      "def change",
      @.getStringOfCommands(),
      "end",
    ]).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  ")

  getStringOfCommands: ->
    commands = @getCommands()
    commands.map((command) ->
      command.toString()
    ).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  ")

  getCommands: ->
    _.flatten(@tables.map((table) ->
      table.getCommands()
    ))
