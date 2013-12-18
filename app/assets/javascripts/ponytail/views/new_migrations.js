Ponytail.Views.NewMigrationView = Backbone.View.extend({
  events: {
    "click .pt_new_table a": "appendTableView"
  },
  initialize: function() {
    var _this = this;
    this.tables = [];
    var migrationFile = new Ponytail.Models.MigrationFile();
    new Ponytail.Views.MigrationFileView({el: $(".migration_file_view"), model: migrationFile});
    $(".pt_table").each(function() {
      var name = $(this).find(".pt_table_name span").text();
      var m = new Ponytail.Models.Table({name: name});
      _this.tables.push(m);
      m.bind("change", function() {
        migrationFile.updateByTables(_this.tables);
      });
      new Ponytail.Views.TableView({el: $(this), model: m});
    });
  },
  appendTableView: function() {
    var m = new Ponytail.Models.Table();
    var v = new Ponytail.Views.TableView({model: m});
    $(".pt_new_table").before(v.render().el);
    return false;
  }
});
