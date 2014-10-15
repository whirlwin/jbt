class ErrorHandler

  configure: ->
    GLOBAL.abort = (errMsg) ->
        logger.error errMsg
        process.exit()

module.exports = new ErrorHandler()