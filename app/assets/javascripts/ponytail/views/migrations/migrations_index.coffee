class Ponytail.Views.MigrationsIndex extends Backbone.View
  events:
    "click .close a": "closeNotice"
    "click .migration_files .filename": "clickFileName"
    "click .delete_file": "clickDeleteFile"
    "click .new_button": "clickNewButton"
    "click .migrate_button": "clickMigrateButton"
    "click .rollback_button": "clickRollbackButton"

  initialize: ->
    @migrations = new Ponytail.Collections.Migrations()
    @schema = new Ponytail.Models.Schema()

  render: =>
    @migrations.fetch
      success: =>
        @migrations.each (model) ->
          v = new Ponytail.Views.MigrationsItem({model: model})
          @$(".migration_files table tbody").append(v.render().el)

        @schema.fetch
          success: =>
            for el in @$("tr")
              version = $(el).find(".version").text()
              if parseInt(version) == @schema.get("version")
                $(el).prepend("<td>*</td>")
              else
                $(el).prepend("<td></td>")

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

  clickDeleteFile: (e) ->
    if confirm('Are you sure?')
      version = $(e.target).parent().parent().find(".version").text()
      $.ajax
        dataType: 'json'
        url: "/ponytail/migrations/#{version}"
        type: 'DELETE'
        success: -> window.location.href = "/ponytail/migrations"
    false

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
