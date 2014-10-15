TaskHandler = require '../task-handler'

class InstallHandler extends TaskHandler

  process: ->
    logger.info 'Installing dependencies'

module.exports = new InstallHandler()