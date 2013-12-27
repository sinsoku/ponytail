class Ponytail.Models.Column extends Backbone.Model
  defaults:
    type: "string",
    name: "new_column",
    isRemoved: false,
    isAdded: false,

  initialize: (attrs, options) ->
    @beforeType = attrs.type || ""
    @beforeName = attrs.name || ""
    func = _.bind(attrs.table.trigger, attrs.table, "change")
    @.bind("change", func)

  isRemoved: ->
    @.get("isRemoved") == true

  isAdded: ->
    @.get("isAdded") == true

  isRename: ->
    @beforeName != @.get("name")

  isChangeType: ->
    @beforeType != @.get("type")

  getCommands: ->
    table = @.get("table")
    if @.isRemoved()
      [new Ponytail.Models.Command("remove_column", ":" + table.get("name"), ":" + @beforeName)]
    else if @.isAdded()
      [new Ponytail.Models.Command("add_column", ":" + table.get("name"), ":" + @.get("name"), ":" + @.get("type"))]
    else
      commands = []
      if @.isRename()
        commands.push(new Ponytail.Models.Command("rename_column", ":" + table.get("name"), ":" + @beforeName, ":" + @.get("name")))
      if @.isChangeType()
        commands.push(new Ponytail.Models.Command("change_column", ":" + table.get("name"), ":" + @.get("name"), ":" + @.get("type")))

      commands
