class Ponytail.Views.MigrationFile extends Backbone.View
  events:
    "click .edit_checkbox input": "clickEditCheckbox"
    "keyup .classname input": (e) ->
      @model.set({className: e.target.value})
    "keyup .raw_content textarea": (e) ->
      @model.set({rawContent: e.target.value})

  initialize: ->
    @model.bind("change", @render)

  render: =>
    @$(".raw_content pre code").text(@model.get("rawContent"))
    if !(@$(".raw_content textarea").is(":visible"))
      @$(".raw_content textarea").val(@model.get("rawContent"))
    @highlightCode()
    @

  highlightCode: ->
    for el in $('pre code')
      hljs.highlightBlock(el)

  clickEditCheckbox: ->
    @$(".raw_content pre").toggle()
    @$(".raw_content textarea").toggle()
