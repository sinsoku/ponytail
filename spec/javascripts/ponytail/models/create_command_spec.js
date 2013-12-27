describe("CreateTableCommand", function() {
  describe("#toString", function() {
    it("it should be able to get string", function() {
      var column = buildModel({type: 'string', name: 'name'});
      var command = new Ponytail.Models.CreateTableCommand('users', [column]);
      var expected = [
        "create_table :users do |t|",
        "  t.string :name",
        "  t.timestamps",
        "end",
      ].join("\n");
      expect(command.toString()).toBe(expected);
    });
  });
});
