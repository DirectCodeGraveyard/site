var cssFiles = [
   'DirectBuild/style.css',
   'developers/core.css',
   'css/core.css',
   'projects/style.css'
];

var jsFiles = [
   'DirectBuild/site.js',
   'developers/developers.js',
   'js/site.js',
   'projects/projects.js'
];

/* global module:false */
module.exports = function (grunt) {
   // Project configuration.
   grunt.initConfig({
      // Task configuration.
      jshint: {
         options: {
            jshintrc: true
         },
         gruntfile: {
            src: 'Gruntfile.js'
         },
         site: {
            src: jsFiles
         }
      },
      watch: {
         gruntfile: {
            files: '<%= jshint.gruntfile.src %>',
            tasks: ['jshint:gruntfile']
         },
         lib_test: {
            files: '**/**',
            tasks: ['default']
         }
      },
      csslint: {
         strict: {
            options: {
               import: 0,
               ids: false,
               important: false,
               "compatible-vendor-prefixes": false,
               "universal-selector": false
            },
            src: cssFiles
         }
      },
      jsbeautifier: {
         files: jsFiles,
         options: {}
      },
      jsonlint: {
         "package.json": [ 'package.json' ],
         projects: [ 'projects/list.json' ]
      }
   });

   require('load-grunt-tasks')(grunt);

   /* Default task. */
   grunt.registerTask('default', ['jsbeautifier', 'jshint', 'csslint', 'jsonlint']);
   /* Travis CI Task */
   grunt.registerTask('travis', ['jshint', 'csslint', 'jsonlint']);
   grunt.registerTask('test', ['jshint', 'csslint', 'jsonlint']);
};