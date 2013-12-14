describe("Table", function() {
  describe("#constructor", function() {
    it("should be able to set tableName", function() {
      var table = new Table({tableName: "users"});
      expect(table.tableName).toBe("users");
    });
  });

  describe("#isSaved", function() {
    describe("don't set isSaved option (default)", function() {
      it("should be false", function() {
        var table = new Table();
        expect(table.isSaved()).toBe(false);
      });
    });
    describe("set isSaved option", function() {
      it("should be true", function() {
        var table = new Table({isSaved: true});
        expect(table.isSaved()).toBe(true);
      });
    });
  });

  describe("#getCommands", function() {
    describe("isCreated set false", function() {
      it("commands[0] to equal CreateTable", function() {
        var table = new Table({isCreated: false});
        var commands = table.getCommands();
        expect(commands[0]).toEqual(jasmine.any(CreateTable));
      });
    });
  });
});
