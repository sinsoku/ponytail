class Ponytail.Views.Index extends Backbone.View
  events:
    "click .close a": "closeNotice"
    "click .migration_files .filename": "clickFileName"
    "click .new_button": "clickNewButton"
    "click .migrate_button": "clickMigrateButton"
    "click .rollback_button": "clickRollbackButton"

  render: ->
    @highlightCode()
    @

  highlightCode: ->
    for el in $('pre code')
      hljs.highlightBlock(el)

  closeNotice: ->
    $(".notice").hide()
    false

  clickFileName: (e) ->
    @$(".migration_file .migration_filename").text(e.target.innerHTML)
    @$(".migration_file .migration_filename").removeClass("highlight")
    setTimeout( ->
      @$(".migration_file .migration_filename").addClass("highlight")
    , 100)
    raw_content = $(e.target).parent().find(".raw_content").text()
    @$(".migration_file .raw_content pre code").text(raw_content)
    @highlightCode()

  clickNewButton: ->
    window.location.href = "migrations/new"

  clickMigrateButton: ->
    window.location.href = "migrations/migrate"

  clickRollbackButton: ->
    window.location.href = "migrations/rollback"
