tasks    = require './tasks/tasks'
minimist = require 'minimist'

class CliParser

  parse: ->
    args = minimist process.argv.slice(2)
    validCommand = tasks.hasOwnProperty args._

    if validCommand
      tasks[args._]
    else
      abort "Invalid task '#{args._}' - Valid tasks are: #{Object.keys(tasks)}"

module.exports = new CliParser()