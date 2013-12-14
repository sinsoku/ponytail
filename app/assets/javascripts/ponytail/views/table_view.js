function TableView(option) {
  var init = option.init !== undefined ? option.init : true;
  if (init) { this.init(option); }
}
TableView.prototype = {
  init: function(option) {
    var _this = this;
    this.element = option.element;
    if (this.element === undefined) {
      this.element = this.createTable();
      this.tableName = this.element.querySelector(".pt_table_name");
      this.inputTableName = this.tableName.querySelector("input");
      this.inputTableName.onblur = function() {
        _this.tableName.innerHTML = this.value;
        // fake it
        _this.command = new CreateTable();
        _this.command.setTableName(this.value);
        _this.callbacks.forEach(function(func) {
          func();
        });
      };
    }
    this.columnElements = this.element.querySelectorAll(".pt_column");
    this.callbacks = [];
    this.command = null;
  },
  addChangeListener: function(callback) {
    this.callbacks.push(callback);
  },
  toCommands: function() {
    // TODO: fake it
    if (this.command !== null) {
      return [this.command];
    } else {
      return [];
    }
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
