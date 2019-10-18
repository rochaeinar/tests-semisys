class StudentInicioConfig
  'use strict'

  constructor: () ->
    angular
    .module 'student'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @StudentInicioConfig
    ]

  StudentInicioConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.student', {
      url: '/estudiantes'
      templateUrl: 'app/student/student-inicio/student-inicio-template.html'
      controller: 'StudentInicioController'
      controllerAs: 'StudentInicioController'
    }

new StudentInicioConfig();
