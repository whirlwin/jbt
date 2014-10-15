winstonConfig = require './winston-config'
errorHandler  = require './error-handler'

class Config

  configure: ->
    winstonConfig.configure()
    errorHandler.configure()

module.exports = new Config()