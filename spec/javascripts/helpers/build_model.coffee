class Model
  constructor: (@obj) ->

  get: (k) ->
    @obj[k]

@buildModel = (attrs) -> new Model(attrs)
