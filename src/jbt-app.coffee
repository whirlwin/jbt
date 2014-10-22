cliParser            = require './cli-parser'
config               = require './config/config'
packageFileValidator = require './validators/package-file-validator'

class JbtApp

  start: ->
    config.configure()
    packageFileValidator.validatePackageFile()
    taskHandlerPath = cliParser.parse()
    taskHandler = require taskHandlerPath
    taskHandler.process()

module.exports = new JbtApp()