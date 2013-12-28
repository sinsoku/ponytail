class Ponytail.Views.MigrationFileView extends Backbone.View
  events:
    "click .pt_edit_checkbox input": "toggleRawContent"
    "click .pt_submit": ->
      @.setRawContentEnabled(true)
    "keyup .pt_class_name input": (e) ->
      @.model.set({className: e.target.value})

  initialize: (options) ->
    @.model.bind("change", @.render)

  render: =>
    $(".pt_raw_content textarea").text(@.model.get("rawContent"))

  toggleRawContent: ->
    @.setRawContentEnabled($(".pt_raw_content textarea").attr("disabled"))

  setRawContentEnabled: (enabled) ->
    if enabled
      $(".pt_raw_content textarea").removeAttr("disabled")
    else
      $(".pt_raw_content textarea").attr("disabled", "disabled")
