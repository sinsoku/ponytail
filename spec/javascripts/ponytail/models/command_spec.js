describe("Command", function() {
  describe("#toString", function() {
    it("it should be able to get string", function() {
      var command = new Ponytail.Models.Command("rename_table", ":users", ":new_users");
      expect(command.toString()).toBe("rename_table :users, :new_users");
    });
  });
});
