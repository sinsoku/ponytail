Ponytail.Views.NewMigrationView = Backbone.View.extend({
  render: function() {
    var migrationFile = new Ponytail.Models.MigrationFile();
    new Ponytail.Views.MigrationFileView({el: $(".migration_file_view"), model: migrationFile}).render();
  }
});
