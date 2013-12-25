Ponytail.Models.Table = Backbone.Model.extend({
  defaults: {
    name: "",
    columns: [],
    isDrop: false,
    isCreated: false,
  },
  initialize: function (attrs, options) {
    this.beforeName = attrs.name || "";
  },
  isCreated: function() {
    return this.get("isCreated") === true;
  },
  isDrop: function() {
    return this.get("isDrop") === true;
  },
  isRename: function() {
    return this.beforeName != this.get("name");
  },
  getCommands: function() {
    if (this.isCreated() && this.isDrop()) {
      return [];
    } else if (this.isCreated() && !this.isDrop()) {
      return [new Ponytail.Models.CreateTableCommand(this.get("name"), this.get("columns"))];
    } else if (!this.isCreated() && this.isDrop()) {
      return [new Ponytail.Models.DropTableCommand(this.beforeName)];
    } else {
      var commands = [];
      if (this.isRename()) {
        commands.push(new Ponytail.Models.RenameTableCommand(this.beforeName, this.get("name")));
      }
      this.get("columns").forEach(function(column) {
        commands.push(column.getCommands());
      });
      return _.compact(_.flatten(commands));
    }
  }
});
