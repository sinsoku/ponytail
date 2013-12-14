function TableView(option) {
  var init = option.init !== undefined ? option.init : true;
  if (init) { this.init(option); }
}
TableView.prototype = {
  init: function(option) {
    var _this = this;
    this.element = option.element;
    var isSaved = true;
    if (this.element === undefined) {
      this.element = this.createTable();
      this.tableNameElement = this.element.querySelector(".pt_table_name");
      this.inputTableName = this.tableNameElement.querySelector("input");
      this.inputTableName.onblur = function() {
        _this.setTableName(this.value);
        _this.callbacks.forEach(function(func) {
          func();
        });
      };
      isSaved = false;
    }
    this.tableNameElement = this.element.querySelector(".pt_table_name");
    this.columnElements = this.element.querySelectorAll(".pt_column");
    this.callbacks = [];

    this.table = new Table({tableName: this.tableNameElement.value, isSaved: isSaved});
    for(var i=0; i<this.columnElements.length; i++) {
      var name = this.columnElements[i].querySelector(".pt_column_name");
      var type = this.columnElements[i].querySelector(".pt_column_type");
      var column = new Column({name: name.innerHTML, type: type.innerHTML});
      this.table.addColumn(column);
    }
  },
  setTableName: function(tableName) {
    this.tableNameElement.innerHTML = tableName;
    this.table.tableName = tableName;
  },
  addChangeListener: function(callback) {
    this.callbacks.push(callback);
  },
  getCommands: function() {
    return this.table.getCommands();
  },
  toElement: function() {
    return this.element;
  },
  createTable: function() {
    var elem = document.createElement("div");
    elem.setAttribute("class", "pt_table");
    elem.innerHTML = '<div class="pt_table_name"><input type="text" /></div><div class="pt_columns"></div>';
    return elem;
  }
};
