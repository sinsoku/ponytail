function TableView(option) {
  this.element = option.element;
  this.callbacks = [];
  this.init();
}
TableView.prototype = {
  init: function() {
    return this;
  },
  addChangeListener: function(callback) {
    this.callbacks.push(callback);
  }
};
