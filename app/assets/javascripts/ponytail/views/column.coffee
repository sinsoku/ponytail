class Ponytail.Views.ColumnView extends Backbone.View
  className: 'pt_column'
  events:
    "click .pt_column_type span": "toggleColumnType"
    "blur .pt_column_type select": "changeColumnType"
    "click .pt_column_name span": "toggleColumnName"
    "keyup .pt_column_name input": (e) ->
      @.model.set({name: e.target.value})
    "blur .pt_column_name input": "toggleColumnName"

  initialize: (options) ->
    @.model.bind("change", @.render)

  render: =>
    if @.el.parentNode == null
      $(@.el).html(_.template($("#column_view_template").html(), @.model.attributes))
    else
      $(@.el).find(".pt_column_type span").text(@.model.get("type"))
      $(@.el).find(".pt_column_name span").text(@.model.get("name"))

    $(@.el).find(".pt_column_type option[value='#{@.model.get("type")}']").attr("selected", true)
    @

  toggleColumnType: ->
    $(@.el).find(".pt_column_type span").toggle()
    $(@.el).find(".pt_column_type select").toggle()

  changeColumnType: (e) ->
    @.model.set({type: e.target.value})
    @.toggleColumnType()

  toggleColumnName: ->
    $(@.el).find(".pt_column_name span").toggle()
    $(@.el).find(".pt_column_name input").toggle()
