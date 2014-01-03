class Ponytail.Views.Table extends Backbone.View
  template: ->
    _.template($("#table_template").html(), @model.attributes)
  className: "table"
  events:
    "click .edit_table": "clickEditTable"
    "click .table_name span": "clickEditTable"
    "keyup .table_name input": "keyupTableNameInput"
    "blur  .table_name input": "blurTableName"
    "click .drop_table": "clickDropTable"
    "click .restore_table": "clickRestoreTable"
    "click .add_column a": "clickAddColumn"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    if @el.parentNode == null
      $(@el).html(@template())
    else
      @$(".table_name span").text(@model.get("name"))
    @

  clickEditTable: ->
    if @$(".table_name span").is(":visible")
      @$(".table_name span").toggle()
      @$(".table_name input").toggle()
    false

  keyupTableNameInput: (e) ->
    @model.set({name: e.target.value})
    # 13(ENTER_KEY)
    if e.which == 13
      @.blurTableName()

  blurTableName: ->
    if @$(".table_name input").is(":visible")
      @$(".table_name span").toggle()
      @$(".table_name input").toggle()

  clickDropTable: ->
    @model.set({isDrop: true})
    @$(".drop_table").hide()
    @$(".restore_table").show()
    false

  clickRestoreTable: ->
    @model.set({isDrop: false})
    @$(".drop_table").show()
    @$(".restore_table").hide()
    false

  clickAddColumn: ->
    column = new Ponytail.Models.Column({table: @model, isAdded: true})
    view = new Ponytail.Views.Column({model: column})
    @$(".add_column").before(view.render().el)
    @model.addColumn(column)
    false
