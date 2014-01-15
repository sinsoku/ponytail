class Ponytail.Views.PreviewCreateFile extends Backbone.View
  events:
    "click .edit_checkbox input": "clickEditCheckbox"
    "keyup .classname input": (e) ->
      @model.set({name: e.target.value})
    "keyup .raw_content textarea": (e) ->
      @model.set({raw_content: e.target.value})
    "click .create_button": "clickCreateButton"

  initialize: ->
    @model.bind("change", @render)

  render: =>
    @$(".raw_content pre code").text(@model.get("raw_content"))
    if !(@$(".raw_content textarea").is(":visible"))
      @$(".raw_content textarea").val(@model.get("raw_content"))
    @highlightCode()
    @

  highlightCode: ->
    for el in $('pre code')
      hljs.highlightBlock(el)

  clickEditCheckbox: ->
    @$(".raw_content pre").toggle()
    @$(".raw_content textarea").toggle()

  clickCreateButton: ->
    $.ajax
      dataType: 'json'
      url: '/ponytail/migrations'
      data:
        ponytail_migration:
          name: @model.get("name")
          raw_content: @model.get("raw_content")
      type: 'POST'
      success: -> window.location.href = "/ponytail/migrations"
