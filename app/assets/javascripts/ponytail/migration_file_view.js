function MigrationFileView(element) {
  this.element = element;
  this.callbacks = [];
}
MigrationFileView.prototype = {
  init: function() {
    var _this = this;
    this.checkBox = document.querySelector(".pt_checkbox");
    this.checkBox.onclick = function() {
      _this.toggleEditRawContent();
    };
    this.classNameElement = document.querySelector(".pt_class_name input");
    this.classNameElement.onkeyup = function() {
      _this.callbacks.forEach(function(func) {
        func();
      });
    };
    this.rawContentElement = document.querySelector(".pt_raw_content textarea");
    this.submitButton = document.querySelector(".pt_submit");
    this.submitButton.onclick = function() {
      _this.rawContentElement.disabled = false;
    };
    return this;
  },
  toggleEditRawContent: function() {
    this.rawContentElement.disabled = !(this.rawContentElement.disabled);
  },
  getClassName: function() {
    var elem = document.querySelector(".pt_class_name input");
    return elem.value;
  },
  setRawContent: function(rawContent) {
    this.rawContentElement.value = rawContent;
  },
  addChangeListener: function(callback) {
    this.callbacks.push(callback);
  }
};
