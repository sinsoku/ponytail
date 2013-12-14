function Table(option) {
  if (option === undefined) { option = {}; }
  this.beforeTableName = option.tableName;
  this.tableName = option.tableName;
  this._isSaved = option.isSaved;
  this._drop = false;
  this.columns = [];
}
Table.prototype = {
  isSaved: function() {
    return this._isSaved ? true : false;
  },
  isDrop: function() {
    return this._drop;
  },
  drop: function() {
    this._drop = true;
  },
  addColumn: function(column) {
    this.columns.push(column);
  },
  getCommands: function() {
    if (this.isDrop() && this.isSaved()) {
      return [new Command("drop_table", ":" + this.beforeTableName)];
    } else if (this.isDrop() && !this.isSaved()) {
      return [];
    } else if (this.isSaved()) {
      var commands = [];
      if (this.beforeTableName != this.tableName) {
        commands.push(new Command("rename_table", ":" + this.beforeTableName, ":" + this.tableName));
      }
      // TODO: add_column, ...etc
      return commands;
    } else {
      var command = new CreateTable();
      command.setTableName(this.tableName);
      return [command];
    }
  }
};
