class Ponytail.Views.MigrationFile extends Backbone.View
  events:
    "click .edit_checkbox input": "clickEditCheckbox"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    @$(".classname span").text(@model.get("className"))
    @$(".raw_content textarea").text(@model.get("rawContent"))

  clickEditCheckbox: ->
    disabled = @$(".raw_content textarea").is(":disabled")
    @.setRawContentEnabled(disabled)

  setRawContentEnabled: (enabled) ->
    if enabled
      @$(".raw_content textarea").removeAttr("disabled")
    else
      @$(".raw_content textarea").attr("disabled", "disabled")


