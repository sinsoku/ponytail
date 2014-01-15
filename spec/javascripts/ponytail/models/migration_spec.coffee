describe "Migration", ->
  describe "#update", ->
    it "should be able to set raw_content", ->
      mFile = new Ponytail.Models.Migration({name: "CreateUsers"})
      spyOn(mFile, "getContentOfClass").andReturn("")
      expected = [
        "class CreateUsers < ActiveRecord::Migration",
        "",
        "end",
      ].join("\n")
      mFile.update()
      actual = mFile.get("raw_content")
      expect(actual).toBe(expected)
