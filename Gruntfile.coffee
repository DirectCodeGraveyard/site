express = require "express"

files =
    js: [
        "DirectBuild/site.js"
        "developers/developers.js"
        "js/site.js"
        "projects/projects.js"
    ]
    css: [
        "DirectBuild/style.css"
        "developers/core.css"
        "css/core.css"
        "projects/style.css"
    ]

module.exports = (grunt) ->
  
  # Project Configuration
  grunt.initConfig
    
    # Task Configuration
    jshint:
      options:
        jshintrc: true

      main:
        src: files.js

    watch:
      js:
        files: files.js
        tasks: ["default"]

    csslint:
      main:
        options:
          import: 0
          ids: false
          important: false
          "compatible-vendor-prefixes": false
          "universal-selector": false

        src: files.css

    jsbeautifier:
      javascript: files.js
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
