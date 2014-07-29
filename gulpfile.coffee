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
    coffee: ['./src/*.coffee']
  dest:
    root: '.'
    dist: './dist'

gulp.task 'bump', ->  
  gulp.src paths.source.manifest
    .pipe bump { type: argv.bump }
    .pipe gulp.dest(paths.dest.root)  

gulp.task 'clean', (done) ->
  del paths.dest.dist, done

gulp.task 'coffee', ->
  gulp.src paths.source.coffee
    .pipe(coffee())
    .pipe gulp.dest paths.dest.dist

gulp.task 'build', ['clean', 'coffee']
gulp.task 'default', ['build']

gulp.task 'watch', ['build'], ->
  gulp.watch paths.coffee, ['coffee']
