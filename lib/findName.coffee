_         = require 'underscore'
unidecode = require 'unidecode'
list      = require './list'

toArray = (el) -> if _.isArray el then el else [ el ]

# Transform the data source array that is nice for maintaining data
# into a format that is nice for programming
processNames = (names) ->
  _.chain(names)
    .map ([ viet, rest... ]) -> [ toArray(viet), rest... ]
