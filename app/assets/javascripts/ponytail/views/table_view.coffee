class Ponytail.Views.TableView extends Backbone.View
  className: "pt_table"
  events:
    "click .pt_table_name span": "toggleTableName"
    "keyup .pt_table_name input": (e) ->
      @.model.set({name: e.target.value})
    "blur .pt_table_name input": "toggleTableName"
    "click .pt_drop_table": "dropTable"
    "click .pt_restore_table": "restoreTable"
    "click .pt_add_column": "addColumn"

  initialize: (options) ->
    @.model.bind("change", @.render)
    table = @.model
    columns = []
    _.each($(@el).find(".pt_column"), (elem) ->
      type = $(elem).find(".pt_column_type span").text()
      name = $(elem).find(".pt_column_name span").text()
      m = new Ponytail.Models.Column({table: table, type: type, name: name})
      new Ponytail.Views.ColumnView({el: elem, model: m}).render()
      columns.push(m)
    )

    @model.set({columns: columns}, {silent: true})

  render: =>
    if @.el.parentNode == null
      $(@.el).html(_.template($("#table_view_template").html(), @.model.attributes))
    else
      $(@.el).find(".pt_table_name span").text(@.model.get("name"))
    @

  updateTableName: ->
    v = $(@.el).find(".pt_table_name input")[0].value
    $(@.el).find(".pt_table_name span").text(v)
    @.model.set({name: v})

  toggleTableName: ->
    $(@.el).find(".pt_table_name span").toggle()
    $(@.el).find(".pt_table_name input").toggle()

  dropTable: (e) ->
    @.model.set({isDrop: true})
    $(@.el).find(".pt_drop_table").hide()
    $(@.el).find(".pt_restore_table").show()
    false

  restoreTable: (e) ->
    @.model.set({isDrop: false})
    $(@.el).find(".pt_drop_table").show()
    $(@.el).find(".pt_restore_table").hide()
    false

  addColumn: (e) ->
    column = new Ponytail.Models.Column({table: @.model, isAdded: true})
    view = new Ponytail.Views.ColumnView({model: column})
    $(@.el).find(".pt_columns").append(view.render().el)
    @.model.addColumn(column)
    false
