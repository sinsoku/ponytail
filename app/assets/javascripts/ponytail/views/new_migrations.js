Ponytail.Views.NewMigrationView = Backbone.View.extend({
  events: {
    "click .pt_new_table a": "appendTableView"
  },
  initialize: function() {
    $(".pt_table").each(function() {
      new Ponytail.Views.TableView({el: $(this)});
    });
    var migrationFile = new Ponytail.Models.MigrationFile();
    new Ponytail.Views.MigrationFileView({el: $(".migration_file_view"), model: migrationFile});
  },
  appendTableView: function() {
    var m = new Ponytail.Models.Table();
    var v = new Ponytail.Views.TableView({model: m});
    $(".pt_new_table").before(v.render().el);
    return false;
  }
});
