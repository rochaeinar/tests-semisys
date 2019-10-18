class SubjectRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'subject'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @SubjectRegisterConfig
    ]

  SubjectRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.subject-register', {
      url: '/materia-registro'
      templateUrl: 'app/subject/subject-register/subject-register-template.html'
      controller: 'SubjectRegisterController'
      controllerAs: 'SubjectRegisterController'
    }

new SubjectRegisterConfig();
