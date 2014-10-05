gulp       = require 'gulp'
gulpCoffee = require 'gulp-coffee'

gulp.task 'build', ->
  gulp.src('src/**/*.coffee')
    .pipe(gulpCoffee())
    .pipe(gulp.dest 'lib')

