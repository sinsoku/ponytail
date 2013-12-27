describe 'Command', ->
  describe '#toString', ->
    it 'it should be able to get string', ->
      command = new Ponytail.Models.Command("rename_table", ":users", ":new_users")
      expect(command.toString()).toBe("rename_table :users, :new_users")
