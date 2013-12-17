describe("Column", function() {
  describe("#constructor", function() {
    var column;
    beforeEach(function() {
      column = new Column({name: "id", type: "integer"});
    });
    it("should be able to set name", function() {
      expect(column.name).toBe("id");
    });
    it("should be able to set type", function() {
      expect(column.type).toBe("integer");
    });
  });
});
