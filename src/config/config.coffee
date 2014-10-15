winstonConfig = require './winston-config'

class Config

  configure: ->
    winstonConfig.configure()

module.exports = new Config()