cliParser = require './cli-parser'

class JbtApp

  start: ->
    taskHandlerPath = cliParser.parse()
    taskHandler = require taskHandlerPath
    taskHandler.process()

module.exports = new JbtApp()