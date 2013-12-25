function buildModel(attrs) {
  var Model = function(obj) {
    this.obj = obj;
  };
  Model.prototype = {
    get: function(k) {
      return this.obj[k];
    }
  };
  return new Model(attrs);
}
