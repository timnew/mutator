require('coffee-script/register')

gulp = require('gulp')
coffee = require('gulp-coffee')
bump = require('gulp-bump')
del = require('del')

argv = require('yargs')
  .alias('b', 'bump')
  .default('bump', 'patch')
  .describe('bump', 'bump [major|minor|patch|prerelease] version')  
  .argv

paths =
  source:   
    manifest: ['./bower.json', 'package.json']
    nodeCoffee: ['./src/node/*.coffee']
    browserCoffee: ['./src/browser/*.coffee']
  dest:
    root: '.'
    lib: './lib'
    dist: './dist'

gulp.task 'bump', ->  
  gulp.src paths.source.manifest
    .pipe bump { type: argv.bump }
    .pipe gulp.dest(paths.dest.root)  

gulp.task 'clean', (done) ->
  del [paths.dest.dist, paths.dest.lib], done

gulp.task 'nodeCoffee', ->
  gulp.src paths.source.nodeCoffee
    .pipe(coffee())
    .pipe gulp.dest paths.dest.lib

gulp.task 'browserCoffee', ->
  gulp.src paths.source.browserCoffee
    .pipe(coffee())
    .pipe gulp.dest paths.dest.dist

gulp.task 'build', ['clean', 'browserCoffee', 'nodeCoffee']
gulp.task 'default', ['build']

gulp.task 'watch', ['build'], ->
  gulp.watch paths.nodeCoffee, ['nodeCoffee']
  gulp.watch paths.browserCoffee, ['browserCoffee']
