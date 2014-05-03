var cssFiles = [
   'DirectBuild/style.css',
   'developers/core.css',
   'css/core.css'
];

var jsFiles = [
   'DirectBuild/site.js',
   'developers/site.js',
   'js/site.js'
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
               ids: false
            },
            src: cssFiles
         }
      },
      jsbeautifier: {
         files: jsFiles,
         options: {}
      }
   });

   require('load-grunt-tasks')(grunt);

   // Default task.
   grunt.registerTask('default', ['jsbeautifier', 'jshint', 'csslint']);
   // Travis CI Task
   grunt.registerTask('travis', ['jshint', 'csslint']);
   grunt.registerTask('test', ['jshint', 'csslint']);
};