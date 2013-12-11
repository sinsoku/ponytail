function CreateTable() {
  this.tableName = "";
}

CreateTable.prototype.setTableName = function(tableName) {
  this.tableName = tableName;
};

CreateTable.prototype.toString = function() {
  return ["create_table :" + this.tableName + " do |t|",
         "  t.timestamps",
         "end"].join("\n");
};
