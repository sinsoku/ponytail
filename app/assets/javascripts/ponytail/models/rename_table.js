function Command() {
  this.args = Array.prototype.slice.call(arguments);
}
Command.prototype = {
  toString: function() {
    return this.args.join(" ");
  }
};
