Ponytail.Models.Column = Backbone.Model.extend({
  defaults: {
    type: "string",
    name: "new_column",
    isRemoved: false,
    isAdded: false,
  },
  initialize: function (attrs, options) {
    this.beforeType = attrs.type || "";
    this.beforeName = attrs.name || "";
    var func = _.bind(attrs.table.trigger, attrs.table, "change");
    this.bind("change", func);
  },
  isRemoved: function() {
    return this.get("isRemoved") === true;
  },
  isAdded: function() {
    return this.get("isAdded") === true;
  },
  isRename: function() {
    return this.beforeName != this.get("name");
  },
  isChangeType: function() {
    return this.beforeType != this.get("type");
  },
  getCommands: function() {
    var table = this.get("table");
    if (this.isRemoved()) {
      return [new Ponytail.Models.Command("remove_column", ":" + table.get("name"), ":" + this.beforeName)];
    } else if (this.isAdded()) {
      return [new Ponytail.Models.Command("add_column", ":" + table.get("name"), ":" + this.get("name"), ":" + this.get("type"))];
    } else {
      var commands = [];
      if (this.isRename()) {
        commands.push(new Ponytail.Models.Command("rename_column", ":" + table.get("name"), ":" + this.beforeName, ":" + this.get("name")));
      }
      if (this.isChangeType()) {
        commands.push(new Ponytail.Models.Command("change_column", ":" + table.get("name"), ":" + this.get("name"), ":" + this.get("type")));
      }
      return commands;
    }
  },
});
