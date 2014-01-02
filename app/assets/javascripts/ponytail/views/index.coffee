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
    latest_version = $("tr:last .version").text()
    $.ajax
      dataType: 'json'
      url: '/ponytail/schema'
      data:
        ponytail_schema:
          version: latest_version
      type: 'PATCH'
      success: () -> window.location.href = "/ponytail/migrations"

  clickRollbackButton: ->
    rollback_index = $("tr").index($(".current"))
    rollback_version = $("tr:eq(#{rollback_index - 1}) .version").text()
    $.ajax
      dataType: 'json'
      url: '/ponytail/schema'
      data:
        ponytail_schema:
          version: rollback_version
      type: 'PATCH'
      success: -> window.location.href = "/ponytail/migrations"
