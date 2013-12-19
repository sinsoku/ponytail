Ponytail.Models.DropTableCommand = function(tableName) {
  this.tableName = tableName;
};
Ponytail.Models.DropTableCommand.prototype = {
  toString: function() {
    return new Ponytail.Models.Command("drop_table", ":" + this.tableName);
  }
};
