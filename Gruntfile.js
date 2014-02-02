var cssFiles = [
    'SimpleCI/core.css'
];

var jsFiles = [
    'SimpleCI/site.js'
];

/* global module:false */
module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        // Task configuration.
        jshint: {
            options: {
                curly: true,
                eqeqeq: true,
                immed: true,
                newcap: true,
                noarg: true,
                sub: true,
                undef: true,
                unused: true,
                boss: true,
                eqnull: true,
                browser: true,
                freeze: true,
                globals: {
                    "$": false,
                    "console": false,
                    "jQuery": false,
                    "require": false,
                    "bootbox": false
                }
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
};