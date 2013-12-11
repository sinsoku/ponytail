function each(elems, func) {
  if (!elems instanceof Array) { elems = [elems]; }
  for (var i = elems.length; i--; ) {
    func(elems[i]);
  }
}

function onClick(elems, func) {
  each(elems, function(elem) {
    elem.onclick = func;
  });
}

function toggleMigrationRawContent() {
  var elems = document.querySelectorAll(".pt_migration .pt_migration_header");
  onClick(elems, function() {
    var content = this.nextElementSibling;
    content.style.display = content.style.display === "" ? "block" : "";
  });
}

function closeNotice() {
  var elems = document.querySelectorAll(".pt_close_notice");
  onClick(elems, function() {
    this.parentElement.style.display = "none";
  });
}

function toggleEditRawContent() {
  var elems = document.querySelectorAll(".pt_checkbox");
  onClick(elems, function() {
    var raw_content = document.querySelectorAll(".pt_raw_content");
    var text_area = raw_content[0].children[0];
    text_area.disabled = !(text_area.disabled);
  });
}

function MigrationFile() {
  this.className = "";
  this.commands = [];
}

MigrationFile.prototype.setClassName = function(className) {
  this.className = className;
};

MigrationFile.prototype.toString = function() {
  return ["class " + this.className + " < ActiveRecord::Migration",
         "  def change",
         this.toStringOfCommands(),
         "  end",
         "end"].join("\n");
};

MigrationFile.prototype.addCommand = function(command) {
  this.commands.push(command);
};

MigrationFile.prototype.toStringOfCommands = function() {
  return this.commands.map(function(command) {
    return command.toString();
  }).join("\n").replace(/^/, "    ").replace("\n", "\n    ");
};

function CreateTable() {
  this.tableName = "";
}

CreateTable.prototype.setTableName = function(tableName) {
  this.tableName = tableName;
};

CreateTable.prototype.toString = function() {
  return ["create_table :" + this.tableName + " do |t|",
         "end"].join("\n");
};

function inputClassName() {
  var elems = document.querySelectorAll(".pt_class_name input");
  elems[0].onkeyup = function() {
    var file = new MigrationFile();
    file.setClassName(this.value);
    var area = document.querySelectorAll(".pt_raw_content textarea")[0];
    area.value = file.toString();
  };
}

function clickNewTable() {
  var elem = document.querySelectorAll(".pt_new_table")[0];
  elem.onclick = function() {
    this.style.display = "none";
    var form = document.querySelectorAll(".pt_new_table_form")[0];
    form.style.display = "block";
  };
}

function inputNewTableName() {
  var elem = document.querySelectorAll(".pt_new_class_name input")[0];
  elem.onkeyup = function() {
    var command = new CreateTable();
    command.setTableName(this.value);
    var file = new MigrationFile();
    file.addCommand(command);
    var area = document.querySelectorAll(".pt_raw_content textarea")[0];
    area.value = file.toString();
  };
}

function setupMigrations() {
  toggleMigrationRawContent();
  closeNotice();
}

function setupNewMigration() {
  toggleEditRawContent();
  inputClassName();
  clickNewTable();
  inputNewTableName();
}
