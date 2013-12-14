function TableView(option) {
  var init = option.init !== undefined ? option.init : true;
  if (init) { this.init(option); }
}
TableView.prototype = {
  init: function(option) {
    this.element = option.element;
    this.callbacks = [];
  },
  addChangeListener: function(callback) {
    this.callbacks.push(callback);
  }
};
