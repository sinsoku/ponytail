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
      isSaved = false;
    }
    this.tableNameElement = this.element.querySelector(".pt_table_name");
    this.tableNameSpanElement = this.tableNameElement.querySelector("span");
    this.inputTableNameElement = this.tableNameElement.querySelector("input");
    this.tableNameSpanElement.onclick = function() {
      _this.tableNameSpanElement.style.display = "none";
      _this.inputTableNameElement.style.display = "block";
      _this.inputTableNameElement.value = _this.tableNameSpanElement.innerHTML;
    };
    this.inputTableNameElement.onblur = function() {
      _this.tableNameSpanElement.style.display = "block";
      _this.inputTableNameElement.style.display = "none";
      _this.setTableName(this.value);
      _this.callbacks.forEach(function(func) {
        func();
      });
    };
    this.columnElements = this.element.querySelectorAll(".pt_column");
    this.dropTableLink = this.element.querySelector("a.pt_drop_table");
    this.dropTableLink.onclick = function() {
      _this.table.drop();
      _this.callbacks.forEach(function(func) {
        func();
      });
      return false;
    };
    this.callbacks = [];

    this.table = new Table({tableName: this.tableNameSpanElement.innerHTML, isSaved: isSaved});
    for(var i=0; i<this.columnElements.length; i++) {
      var name = this.columnElements[i].querySelector(".pt_column_name");
      var type = this.columnElements[i].querySelector(".pt_column_type");
      var column = new Column({name: name.innerHTML, type: type.innerHTML});
      this.table.addColumn(column);
    }
  },
  setTableName: function(tableName) {
    this.tableNameSpanElement.innerHTML = tableName;
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
    elem.innerHTML = '<div class="pt_table_name"><span>tables</span><input type="text" /></div><a href="#" class="pt_drop_table">drop</a><div class="pt_columns"></div>';
    return elem;
  }
};
