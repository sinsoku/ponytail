Ponytail.Models.RenameTableCommand = function(tableName, newName) {
  this.tableName = tableName;
  this.newName = newName;
};
Ponytail.Models.RenameTableCommand.prototype = {
  toString: function() {
    return new Ponytail.Models.Command("rename_table", ":" + this.tableName, ":" + this.newName);
  }
};
