Ponytail.Models.CreateTableCommand = function(tableName, columns) {
  this.tableName = tableName;
  this.columns = columns;
};
Ponytail.Models.CreateTableCommand.prototype = {
  toString: function() {
    return [
        "create_table :" + this.tableName + " do |t|",
        this.columns.map(function(column) {
          return "t." + column.type + " :" + column.name;
        }).join("\n").replace(/^/, "  ").replace(/\n/g, "\n  "),
        "  t.timestamps",
        "end",
      ].join("\n");
  }
};
