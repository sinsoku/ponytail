describe "MigrationFile", ->
  describe "#update", ->
    it "should be able to set rawContent", ->
      mFile = new Ponytail.Models.MigrationFile({className: "CreateUsers"})
      spyOn(mFile, "getContentOfClass").andReturn("")
      expected = [
        "class CreateUsers < ActiveRecord::Migration",
        "",
        "end",
      ].join("\n")
      mFile.update()
      actual = mFile.get("rawContent")
      expect(actual).toBe(expected)
