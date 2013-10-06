if require?
  _        = require 'underscore'
  FuzzySet = require 'fuzzyset.js'
else
  setTimeout (->
    console.log _, FuzzySet
    { _, FuzzySet } = window
  ), 0

# Server and client side

findNames = (names, sourceName) ->
  a = FuzzySet()
  names.forEach (row) ->
    row.normalized.forEach (name) ->
      a.add name
  suggestions = a.get sourceName
  names.filter (row) ->
    _.some row.normalized, (n) ->
      _.some suggestions, (s) -> s[1] is n

if module?
  module.exports = findNames

if module? and ! module.parent
  list         = require './list'
  processNames = require './processNames'
  names        = processNames list.sur.u
  sourceName   = process.argv[2]
  name         = findNames names, sourceName
  require('eyes').inspect name, 'Vietnamese name'

unless module?
  window.VietNameExample = findNames
