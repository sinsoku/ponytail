describe 'Table', ->
  describe '#getCommands', ->
    describe 'if table was created', ->
      it 'should be a kind of CreateTableCommand', ->
        table = new Ponytail.Models.Table({isCreated: true})
        command = table.getCommands()[0]
        expect(command).toEqual(jasmine.any(Ponytail.Models.CreateTableCommand))

    describe 'if table was dropped', ->
      it 'should be a kind of DropTableCommand', ->
        table = new Ponytail.Models.Table({isDrop: true})
        command = table.getCommands()[0]
        expect(command).toEqual(jasmine.any(Ponytail.Models.DropTableCommand))

    describe 'if table was created, and was dropped', ->
      it 'should be []', ->
        table = new Ponytail.Models.Table({isCreated: true, isDrop: true})
        expect(table.getCommands()).toEqual([])
