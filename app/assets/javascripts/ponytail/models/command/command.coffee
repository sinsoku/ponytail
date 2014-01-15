class Ponytail.Models.Command
  constructor: (@args...) ->

  toString: ->
    "#{@args[0]} #{@args[1..].join(', ')}"
