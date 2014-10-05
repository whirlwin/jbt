TaskHandler = require '../task-handler'

class InstallHandler extends TaskHandler

  process: ->
    console.log('Processing install task')

module.exports = new InstallHandler()