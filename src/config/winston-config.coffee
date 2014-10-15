winston = require 'winston'

class WinstonConfig

  configure: ->
    GLOBAL.logger = winston.cli()

module.exports = new WinstonConfig()