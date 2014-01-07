describe 'CreateTableCommand', ->
  describe '#toString', ->
    it 'it should be able to get string', ->
      column = buildModel({type: 'string', name: 'name'})
      command = new Ponytail.Models.CreateTableCommand('users', [column])
      expected = [
        "create_table :users do |t|",
        "  t.string :name",
        "  t.timestamps",
        "end",
      ].join("\n")
      expect(command.toString()).toBe(expected)
