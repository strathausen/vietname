_         = require 'underscore'
unidecode = require 'unidecode'

# Server side only

toArray = (el) -> if _.isArray el then el else [ el ]

# Transform the data source array that is nice for maintaining data
# into a format that is nice for programming
module.exports = processNames = (names) ->
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
    .map((row) ->
      row.normalized = row.vietnamese.map unidecode
      row
    )
    .value()

unless module.parent
  list         = require './list'
  console.log 'window.VietName={list:' +
    JSON.stringify(processNames list.sur.u) + '};'
