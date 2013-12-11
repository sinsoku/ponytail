describe("MigrationFile", function() {
  describe("#setClassName", function() {
    it("should be able to set className", function() {
      var file = new MigrationFile();
      file.setClassName("CreateUsers");
      expect(file.className).toBe("CreateUsers");
    });
  });
});
