express = require("express")
cssFiles = [
  "DirectBuild/style.css"
  "developers/core.css"
  "css/core.css"
  "projects/style.css"
]
jsFiles = [
  "DirectBuild/site.js"
  "developers/developers.js"
  "js/site.js"
  "projects/projects.js"
]

module.exports = (grunt) ->
  
  # Project Configuration
  grunt.initConfig
    
    # Task Configuration
    jshint:
      options:
        jshintrc: true

      gruntfile:
        src: "Gruntfile.js"

      site:
        src: jsFiles

    watch:
      gruntfile:
        files: "<%= jshint.gruntfile.src %>"
        tasks: ["jshint:gruntfile"]

      lib_test:
        files: "**/**"
        tasks: ["default"]

    csslint:
      strict:
        options:
          import: 0
          ids: false
          important: false
          "compatible-vendor-prefixes": false
          "universal-selector": false

        src: cssFiles

    jsbeautifier:
      javascript: jsFiles
      gruntfile: "Gruntfile.js"
      options: {}

    jsonlint:
      "package.json": ["package.json"]
      projects: ["projects/list.json"]

  require("load-grunt-tasks") grunt
  
  # Default Task
  grunt.registerTask "default", [
    "jsbeautifier"
    "jshint"
    "csslint"
    "jsonlint"
  ]
  
  # Travis CI Task
  grunt.registerTask "travis", [
    "jshint"
    "csslint"
    "jsonlint"
  ]
  
  # Testing Task
  grunt.registerTask "test", [
    "jshint"
    "csslint"
    "jsonlint"
  ]
  
  # Server Task
  grunt.registerTask "serve", ->
    app = express()
    app.use express.static(".")
    app.listen 8080, process.env.OPENSHIFT_DIY_IP or "0.0.0.0"
    @async()
