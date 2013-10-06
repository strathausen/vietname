_         = require 'underscore'
unidecode = require 'unidecode'
FuzzySet  = require 'fuzzyset.js'
list      = require './list'

toArray = (el) -> if _.isArray el then el else [ el ]

# Transform the data source array that is nice for maintaining data
# into a format that is nice for programming
processNames = (names) ->
  _.chain(names)
    # make the data programmer friendly :)
    .map(([ vietnamese, chinese, description ]) ->
      { vietnamese, chinese, description }
    )
    # multiple entries possible for some fields
    .map((row) ->
      row.vietnamese = toArray row.vietnamese
      row.chinese = toArray row.chinese
      row
    )
    .value()

findName = (names, sourceName) ->
  names.map (row) ->
    row.normalized = row.vietnamese.map unidecode

  a = FuzzySet()
  names.forEach (row) ->
    row.normalized.forEach (name) ->
      a.add name
  suggestions = a.get sourceName

names = processNames list.sur.u
sourceName = process.argv[2]
name = findName names, sourceName

require('eyes').inspect name, 'Vietnamese name'
