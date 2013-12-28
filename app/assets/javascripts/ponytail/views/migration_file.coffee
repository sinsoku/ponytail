class Ponytail.Views.MigrationFile extends Backbone.View
  events:
    "click .edit_checkbox input": "clickEditCheckbox"
    "keyup .classname input": (e) ->
      @model.set({className: e.target.value})
    "click .create_button": "clickCreateButton"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    @$(".raw_content textarea").text(@model.get("rawContent"))

  clickEditCheckbox: ->
    disabled = @$(".raw_content textarea").is(":disabled")
    @.setRawContentEnabled(disabled)

  setRawContentEnabled: (enabled) ->
    if enabled
      @$(".raw_content textarea").removeAttr("disabled")
    else
      @$(".raw_content textarea").attr("disabled", "disabled")

  clickCreateButton: ->
    # TODO:
    alert("coming soon...")
    false
