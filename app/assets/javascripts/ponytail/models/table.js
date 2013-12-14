function Table(option) {
  if (option === undefined) { option = {}; }
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
      return [];
    } else {
      var command = new CreateTable();
      command.setTableName(this.tableName);
      return [command];
    }
  }
};
