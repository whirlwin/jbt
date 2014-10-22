del        = require 'del'
gulp       = require 'gulp'
gulpCoffee = require 'gulp-coffee'

gulp.task 'build', ->
  gulp.src('src/**/*.coffee')
    .pipe(gulpCoffee())
    .pipe(gulp.dest 'lib')

gulp.task 'dev', ->
  gulp.watch 'src/**/*.coffee', ['build']

gulp.task 'clean', ->
  del 'lib/**/'