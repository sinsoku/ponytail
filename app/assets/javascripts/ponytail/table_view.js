function TableView(option) {
  var init = option.init !== undefined ? option.init : true;
  if (init) { this.init(option); }
}
TableView.prototype = {
  init: function(option) {
    this.element = option.element;
    if (this.element === undefined) {
      this.element = document.createElement("div");
      this.element.setAttribute("class", "pt_table");
      this.element.innerHTML = '<div class="pt_table_name"><input type="text" /></div><div class="pt_columns"></div>';
    }
    this.columnElements = document.querySelectorAll(".pt_column");
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
  }
};
