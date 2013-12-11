function toggleEditRawContent() {
  var elem = document.querySelectorAll(".pt_checkbox")[0];
  elem.onclick = function() {
    var raw_content = document.querySelectorAll(".pt_raw_content");
    var text_area = raw_content[0].children[0];
    text_area.disabled = !(text_area.disabled);
  };
}

function getMigrationClassName() {
  var elem = document.querySelectorAll(".pt_class_name input")[0];
  return elem.value;
}

function getNewTableName() {
  var elem = document.querySelectorAll(".pt_new_class_name input")[0];
  return elem.value;
}

function inputClassName() {
  var elems = document.querySelectorAll(".pt_class_name input");
  elems[0].onkeyup = function() {
    var file = new MigrationFile();
    file.setClassName(this.value);
    var command = new CreateTable();
    command.setTableName(getNewTableName());
    file.addCommand(command);
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
    var file = new MigrationFile();
    file.setClassName(getMigrationClassName());
    var command = new CreateTable();
    command.setTableName(this.value);
    file.addCommand(command);
    var area = document.querySelectorAll(".pt_raw_content textarea")[0];
    area.value = file.toString();
  };
}

function setupNewMigration() {
  toggleEditRawContent();
  inputClassName();
  clickNewTable();
  inputNewTableName();
}
