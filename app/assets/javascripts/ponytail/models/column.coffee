class Ponytail.Models.Column extends Backbone.Model
  defaults:
    name: "new_column",
    type: "string",

  initialize: (attrs) ->
    @attributes.isRemoved = attrs.isRemoved || false
    @attributes.isAdded = attrs.isAdded || false
    @beforeType = attrs.type || ""
    @beforeName = attrs.name || ""
    table = @get("table")
    func = _.bind(table.trigger, table, "change")
    @bind("change", func)

  isRemoved: ->
    @get("isRemoved") == true

  isAdded: ->
    @get("isAdded") == true

  isRename: ->
    @beforeName != @get("name")

  isChangeType: ->
    @beforeType != @get("type")

  getCommands: ->
    table = @get("table")
    if @isRemoved() && @isAdded()
      []
    else if @isRemoved()
      [new Ponytail.Models.Command("remove_column", ":" + table.get("name"), ":" + @beforeName)]
    else if @isAdded()
      [new Ponytail.Models.Command("add_column", ":" + table.get("name"), ":" + @get("name"), ":" + @get("type"))]
    else
      commands = []
      if @isRename()
        commands.push(new Ponytail.Models.Command("rename_column", ":" + table.get("name"), ":" + @beforeName, ":" + @get("name")))
      if @isChangeType()
        commands.push(new Ponytail.Models.Command("change_column", ":" + table.get("name"), ":" + @get("name"), ":" + @get("type")))

      commands
