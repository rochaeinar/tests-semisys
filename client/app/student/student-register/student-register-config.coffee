class StudentRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'student'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @StudentRegisterConfig
    ]

  StudentRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.student-register', {
      url: '/estudiante-registro'
      templateUrl: 'app/student/student-register/student-register-template.html'
      controller: 'StudentRegisterController'
      controllerAs: 'StudentRegisterController'
    }

new StudentRegisterConfig();
