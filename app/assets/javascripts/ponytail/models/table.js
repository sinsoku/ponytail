function Table(option) {
  if (option === undefined) { option = {}; }
  this.beforeTableName = option.tableName;
  this.tableName = option.tableName;
  this._isSaved = option.isSaved;
  this.columns = [];
}
Table.prototype = {
  isSaved: function() {
    return this._isSaved ? true : false;
  },
  addColumn: function(column) {
    this.columns.push(column);
  },
  getCommands: function() {
    if (this.isSaved()) {
      // TODO: add_column, ...etc
      var commands = [];
      if (this.beforeTableName != this.tableName) {
        commands.push(new Command("rename_table", ":" + this.beforeTableName, ":" + this.tableName));
      }
      return commands;
    } else {
      var command = new CreateTable();
      command.setTableName(this.tableName);
      return [command];
    }
  }
};
