function MigrationFile() {
  this.className = "";
  this.commands = [];
}
MigrationFile.prototype = {
  setClassName: function(className) {
    this.className = className;
  },
  toString: function() {
    return ["class " + this.className + " < ActiveRecord::Migration",
           "  def change",
           this.toStringOfCommands(),
           "  end",
           "end"].join("\n");
  },
  addCommand: function(command) {
    this.commands.push(command);
  },
  toStringOfCommands: function() {
    return this.commands.map(function(command) {
      return command.toString();
    }).join("\n").replace(/^/, "    ").replace(/\n/g, "\n    ");
  }
};
