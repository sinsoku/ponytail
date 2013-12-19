Ponytail.Models.Table = Backbone.Model.extend({
  defaults: {
    name: "",
    columns: [],
    isDrop: false,
    isCreated: false,
  },
  getCommands: function() {
    // TODO: fake it
    var command = new Ponytail.Models.Command("rename_table", ":users", ":aaa");
    return [command];
  }
});
