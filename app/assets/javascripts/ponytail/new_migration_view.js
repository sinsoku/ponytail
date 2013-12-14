function NewMigrationView(option) {
  var init = option.init !== undefined ? option.init : true;
  if (init) { this.init(option); }
}
NewMigrationView.prototype = {
  init: function(option) {
    this.element = option.element;
    this.tableViews = [];
    this.newTableLink = null;
    this.migrationFileView = null;
    this.initTableViews();
    this.initMigrationView();
    this.initNewTableLink();
  },
  initTableViews: function() {
    var elems = document.querySelectorAll(".pt_table");
    var _this = this;
    var func = function() {
      _this.updateMigrationFileView();
    };
    for(var i=0; i<elems.length; i++) {
      var tableView = new TableView({element: elems[i]});
      tableView.addChangeListener(func);
      this.tableViews.push(tableView);
    }
  },
  initNewTableLink: function() {
    var _this = this;
    this.newTableLink = document.querySelector(".pt_new_table a");
    this.newTableLink.onclick = function() {
      var schema = document.querySelector(".pt_new .pt_schema");
      var newTable = document.querySelector(".pt_new .pt_new_table");
      var tableView = new TableView({});
      tableView.addChangeListener(function() {
        _this.updateMigrationFileView();
      });
      _this.tableViews.push(tableView);
      schema.insertBefore(tableView.toElement(), newTable);
      return false;
    };
  },
  initMigrationView: function() {
    var elem = document.querySelector("form.new_ponytail_migration");
    this.migrationFileView = new MigrationFileView({element: elem});
    var _this = this;
    this.migrationFileView.addChangeListener(function() {
      _this.updateMigrationFileView();
    });
  },
  updateMigrationFileView: function() {
    var file = new MigrationFile();
    file.setClassName(this.migrationFileView.getClassName());
    this.tableViews.forEach(function(tableView) {
      tableView.toCommands().forEach(function(command) {
        file.addCommand(command);
      });
    });
    this.migrationFileView.setRawContent(file.toString());
  }
};
