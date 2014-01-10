class Ponytail.Views.PreviewMigration extends Backbone.View
  template: (json) ->
    _.template($("#preview_migration_template").html(), json)

  render: ->
    @setElement(@template(@model.toJSON()))
