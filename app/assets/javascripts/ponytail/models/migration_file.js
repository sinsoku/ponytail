Ponytail.Models.MigrationFile = Backbone.Model.extend({
  defaults: {
    className: "",
    rawContent: "",
  },
  initialize: function(attrs, options) {
    this.tables = [];
    this.bind("change:className", this.update);
  },
  updateByTables: function(tables) {
    this.tables = tables;
    this.update();
  },
  update: function() {
    var rawContent = [
      "class " + this.get("className") + " < ActiveRecord::MigrationFile",
      this.getContentOfClass(),
      "end",
    ].join("\n");
    this.set({"rawContent": rawContent});
  },
  getContentOfClass: function() {
    return _.compact([
      "def change",
      this.getStringOfCommands(),
      "end",
    ]).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  ");
  },
  getStringOfCommands: function() {
    var commands = this.getCommands();
    return commands.map(function(command) {
      return command.toString();
    }).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  ");
  },
  getCommands: function() {
    return _.flatten(this.tables.map(function(table) {
      return table.getCommands();
    }));
  },
});
