gulp = require 'gulp'

nib = require 'nib'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
watchify = require 'watchify'
coffeeify = require 'coffeeify'
browserify = require 'browserify'

jade = require 'gulp-jade'
csso = require 'gulp-csso'
cache = require 'gulp-cached'
coffee = require 'gulp-coffee'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
reload = require 'gulp-livereload'
htmlmin = require 'gulp-minify-html'

gutil = require 'gulp-util'
gif = require 'gulp-if'
sourcemaps = require 'gulp-sourcemaps'


nodemon = require 'gulp-nodemon'
autoprefixer = require 'autoprefixer-stylus'
autowatch = require 'gulp-autowatch'


# paths
paths =
  vendor: './client/vendor/**/*'
  img: './client/img/**/*'
  fonts: './client/fonts/**/*'
  coffee: './client/**/*.coffee'
  bundle: './client/index.coffee'
  stylus: './client/**/*.styl'
  jade: './client/**/*.jade'

gulp.task 'server', (cb) ->
  watcher = nodemon
    script: './server/index.coffee'
    watch: ['./server']
    ext: 'js json coffee'
    ignore: './server/test'

  watcher.once 'start', cb
  watcher.on 'start', ->
    # TODO: make sure this is actually right
    setTimeout reload.reload, 750
  return

# javascript
args =
  debug: true
  fullPaths: true
  cache: {}
  packageCache: {}
  extensions: ['.coffee']

bundler = watchify browserify paths.bundle, args
bundler.transform coffeeify

gulp.task 'coffee', ->
  bundler.bundle()
    .once 'error', (err) ->
      console.error err.message
    .pipe source 'index.js'
    .pipe buffer()
    .pipe cache 'js'
    .pipe sourcemaps.init
      loadMaps: true
    .pipe sourcemaps.write '.'
    .pipe gulp.dest './public'
    .pipe gif '*.js', reload()

# styles
gulp.task 'stylus', ->
  gulp.src paths.stylus
    .pipe sourcemaps.init()
    .pipe stylus
      use:[
        autoprefixer cascade: true
        nib()
      ]
    .pipe sourcemaps.write()
    .pipe concat 'app.css'
    .pipe gif gutil.env.production, csso()
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'jade', ->
  gulp.src paths.jade
    .pipe jade()
    .pipe cache 'html'
    .pipe gif gutil.env.production, htmlmin()
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'vendor', ->
  gulp.src paths.vendor
    .pipe cache 'vendor'
    .pipe gulp.dest './public/vendor'
    .pipe reload()

gulp.task 'img', ->
  gulp.src paths.img
    .pipe cache 'img'
    .pipe gulp.dest './public/img'
    .pipe reload()

gulp.task 'fonts', ->
  gulp.src paths.fonts
    .pipe cache 'fonts'
    .pipe gulp.dest './public/fonts'
    .pipe reload()

gulp.task 'watch', ->
  autowatch gulp, paths


gulp.task 'css', ['stylus']
gulp.task 'js', ['coffee']
gulp.task 'static', ['jade', 'vendor', 'img', 'fonts']
gulp.task 'default', ['js', 'css', 'static', 'server', 'watch']
