class StudentEditPersonalConfig
  'use strict'

  constructor: () ->
    angular
    .module 'student'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @StudentEditPersonalConfig
    ]

  StudentEditPersonalConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.student-edit-personal', {
      url: '/estudiante-datos-personales-editar'
      templateUrl: 'app/student/student-edit-personal/student-edit-personal-template.html'
      controller: 'StudentEditPersonalController'
      controllerAs: 'StudentEditPersonalController'
      params: {
        student: null
      }
    }

new StudentEditPersonalConfig();
