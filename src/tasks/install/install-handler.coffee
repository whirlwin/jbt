dependencyRetriever = require './dependency-retriever'
TaskHandler         = require '../task-handler'

class InstallHandler extends TaskHandler

  process: ->
    logger.info 'Installing dependencies'
    dependencyRetriever.retrieveDependencies()

module.exports = new InstallHandler()