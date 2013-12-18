Ponytail.Models.Command = function() {
  this.args = Array.prototype.slice.call(arguments);
};
Ponytail.Models.Command.prototype = {
  toString: function() {
    return this.args.shift() + " " + this.args.join(", ");
  }
};
