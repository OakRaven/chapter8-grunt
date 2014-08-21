module.exports = (grunt) ->
  moment = require 'moment'

  getDateString = ->
    moment().format('YYYYMMDDHHmm')

  grunt.initConfig

    copy:
      staging:
        files: [
          {
            expand: true
            cwd: 'src'
            src: [ 'app/**', 'img/**', 'js/**' ]
            dest: 'staging/'
            filter: 'isFile' }
          {
            expand: true
            cwd: 'build'
            src: [ 'css/*.css' ]
            dest: 'staging/'
            filter: 'isFile' }
          {
            src: 'src/index-dev.html'
            dest: 'staging/index.html'
            filter: 'isFile'} ]

      release:
        files: [
          {
            expand: true
            cwd: 'src'
            src: [ 'index.html', 'img/**', 'js/**', \
              '!js/cs.js', '!js/text.js', '!js/underscore.js', \
              '!js/coffee-script.js' ]
            dest: 'release/'
            filter: 'isFile' }
          {
            expand: true
            cwd: 'build'
            src: [ 'css/*.css' ]
            dest: 'release/'
            filter: 'isFile' } ]


    clean: ['release/js/']

    less:
      development:
        options:
          concat: false
        files: [
          expand: true
          concat: false
          cwd: 'src/css'
          src: [ '*.less' ]
          dest: 'build/css'
          ext: '.css'
        ]

    requirejs:
      compile:
        options:
          baseUrl: 'src/app'
          mainConfigFile: 'src/app/main.js'
          out: "release/js/v#{getDateString()}.js"
          name: 'main'
          paths:
            requireLib: '../vendor/requirejs/require'
          include: [ "requireLib" ]

    replace:
      index:
        src: 'src/index-release.html'
        dest: 'release/index.html'
        replacements: [
          from: 'BUILD_FILENAME'
          to: "v#{getDateString()}.js"
        ]

    connect:
      staging:
        options:
          keepalive: true
          hostname: 'localhost'
          port: 8080
          base: './staging'
          open: true

      release:
        options:
          keepalive: true
          hostname: 'localhost'
          port: 8000
          base: './release'
          open: true

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-text-replace'

  grunt.registerTask 'default', [ 'less', 'copy:staging' ]
  grunt.registerTask 'build', \
    [ 'clean', 'requirejs', 'less', 'copy:release', 'replace' ]
  grunt.registerTask 'server', [ 'default', 'connect:staging' ]
  grunt.registerTask 'server-release', \
    [ 'default', 'connect:release' ]
