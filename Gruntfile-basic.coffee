module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        files:
          'public/js/app.js': 'src/app/app.coffee'
          'public/js/all.js': 'src/app/**/*.coffee'
          'public/js/two.js': [
            'src/app/csmain.coffee', 'src/app/data.coffee'
          ]

    uglify:
      target:
        files:
          'public/js/all.min.js': 'public/js/all.js'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', ->
    grunt.log.writeln 'This from the default grunt task'

  grunt.registerTask 'build', ['coffee', 'uglify']
