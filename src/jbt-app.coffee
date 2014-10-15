cliParser = require './cli-parser'
config    = require './config/config'

class JbtApp

  start: ->
    config.configure()
    taskHandlerPath = cliParser.parse()
    taskHandler = require taskHandlerPath
    taskHandler.process()

module.exports = new JbtApp()