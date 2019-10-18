module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      coffee_to_js:
        options:
          bare: true
          sourceMap: false
        expand: true
        flatten: false
        cwd: "."
        src: ["**/*.coffee"]
        dest: 'build'
        ext: ".js"
    copy:
      client:
        src: ['certs/**', 'client/**/*.html', 'client/**/*.css', 'client/assets/**', 'clienthttp/**']
        expand: true
        dest: 'build/'
      json:
        src: ['config.json', 'package.json', 'bower.json', '.bowerrc']
        expand: true
        dest: 'build/'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.registerTask 'default', [
    'coffee'
    'copy:client'
    'copy:json'
  ]
