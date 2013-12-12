function TableView(element) {
  this.element = element;
  this.callbacks = [];
}
TableView.prototype = {
  init: function() {
    return this;
  },
  addChangeListener: function(callback) {
    this.callbacks.push(callback);
  }
};
