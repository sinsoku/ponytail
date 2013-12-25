describe("Table", function() {
  describe("#getCommands", function() {
    describe("if table was created", function() {
      it("should be a kind of CreateTableCommand ", function() {
        var table = new Ponytail.Models.Table({isCreated: true});
        var command = table.getCommands()[0];
        expect(command).toEqual(jasmine.any(Ponytail.Models.CreateTableCommand));
      });
    });
    describe("if table was dropped", function() {
      it("should be a kind of DropTableCommand ", function() {
        var table = new Ponytail.Models.Table({isDrop: true});
        var command = table.getCommands()[0];
        expect(command).toEqual(jasmine.any(Ponytail.Models.DropTableCommand));
      });
    });
    describe("if table was created, and was dropped", function() {
      it("should be []", function() {
        var table = new Ponytail.Models.Table({isCreated: true, isDrop: true});
        expect(table.getCommands()).toEqual([]);
      });
    });
  });
});
