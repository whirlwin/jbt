class JbtApp

  start: ->
    console.log('foobar!' + process.argv[2])

module.exports = new JbtApp()