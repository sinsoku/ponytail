Ponytail.Models.MigrationFile = Backbone.Model.extend({
  defaults: {
    className: "",
    rawContent: "",
  },
  initialize: function(attrs, options) {
    this.tables = [];
  },
  updateByTables: function(tables) {
    this.tables = tables;
    this.update();
  },
  update: function() {
    var rawContent = [
      "class " + this.get("className") + " < ActiveRecord::MigrationFile",
      this.getStringOfCommands(),
      "end",
    ].join("\n");
    this.set({"rawContent": rawContent});
  },
  getStringOfCommands: function() {
    return [
      "  def change",
      "  end",
    ].join("\n");
  }
});
