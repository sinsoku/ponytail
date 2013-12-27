class Ponytail.Views.Index extends Backbone.View
  events:
    "click .close": "closeNotice"
    "click .migration_files .filename": "clickFileName"
    "click .new_button": "clickNewButton"
    "click .migrate_button": "clickMigrateButton"
    "click .rollback_button": "clickRollbackButton"

  closeNotice: ->
    $(".notice").hide()
    false

  clickFileName: (e) ->
    @$(".migration_file .filename").text(e.target.innerHTML)
    raw_content = $(e.target).parent().find(".raw_content").text()
    @$(".migration_file .raw_content pre").text(raw_content)

  clickNewButton: ->
    window.location.href = "migrations/new"

  clickMigrateButton: ->
    window.location.href = "migrations/migrate"

  clickRollbackButton: ->
    window.location.href = "migrations/rollback"
