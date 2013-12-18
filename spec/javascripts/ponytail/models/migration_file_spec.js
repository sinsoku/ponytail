describe("MigrationFile", function() {
  describe("#update", function() {
    it("should be able to set rawContent", function() {
      var mFile = new Ponytail.Models.MigrationFile({className: "CreateUsers"});
      spyOn(mFile, "getStringOfCommands").andReturn("");
      var expected = [
        "class CreateUsers < ActiveRecord::MigrationFile",
        "",
        "end",
      ].join("\n");
      mFile.update();
      var actual = mFile.get("rawContent");
      expect(actual).toBe(expected);
    });
  });
});
