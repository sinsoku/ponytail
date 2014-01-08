class Ponytail.Views.MigrationsItem extends Backbone.View
  template: (json) ->
    _.template($("#migrations_item_template").html(), json)

  render: ->
    @setElement(@template(@model.toJSON()))
