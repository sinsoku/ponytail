function NewMigrationView(option) {
  this.element = option.element;
  this.tableViews = [];
  this.newTableLink = null;
  this.migrationFileView = null;
  this.init();
}
NewMigrationView.prototype = {
  init: function() {
    this.initTableViews();
    this.initMigrationView();
    this.initNewTableLink();
    return this;
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
    this.newTableLink = document.querySelector(".pt_new_table a");
    this.newTableLink.onclick = function() {
      // TODO: append table view
      this.style.display = "none";
      var form = document.querySelector(".pt_new_table_form");
      form.style.display = "block";
      return false;
    };
    var _this = this;
    this.newClassNameInput = document.querySelector(".pt_new_class_name input");
    this.newClassNameInput.onkeyup = function() {
      _this.updateMigrationFileView();
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
    var command = new CreateTable();
    command.setTableName(this.newClassNameInput ? this.newClassNameInput.value : "");
    file.addCommand(command);
    this.migrationFileView.setRawContent(file.toString());
  }
};
