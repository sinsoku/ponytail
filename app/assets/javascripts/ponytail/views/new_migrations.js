Ponytail.Views.NewMigrationView = Backbone.View.extend({
  events: {
    "click .pt_new_table a": "appendTableView"
  },
  initialize: function() {
    var tables = [];
    $(".pt_table").each(function() {
      var name = $(this).find(".pt_table_name span").text();
      var m = new Ponytail.Models.Table({name: name});
      tables.push(m);
      new Ponytail.Views.TableView({el: $(this), model: m});
    });
    var migrationFile = new Ponytail.Models.MigrationFile({tables: tables});
    new Ponytail.Views.MigrationFileView({el: $(".migration_file_view"), model: migrationFile});
    tables.forEach(function(table) {
      table.bind("change", function() {
        migrationFile.update();
      });
    });
  },
  appendTableView: function() {
    var m = new Ponytail.Models.Table();
    var v = new Ponytail.Views.TableView({model: m});
    $(".pt_new_table").before(v.render().el);
    return false;
  }
});
