function CreateTable() {
  this.tableName = "";
}
CreateTable.prototype = {
  setTableName: function(tableName) {
    this.tableName = tableName;
  },
  toString: function() {
    return ["create_table :" + this.tableName + " do |t|",
           "  t.timestamps",
           "end"].join("\n");
  }
};
