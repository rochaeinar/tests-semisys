class SubjectInicioConfig
  'use strict'

  constructor: () ->
    angular
    .module 'subject'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @SubjectInicioConfig
    ]

  SubjectInicioConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.subject', {
      url: '/materias'
      templateUrl: 'app/subject/subject-inicio/subject-inicio-template.html'
      controller: 'SubjectInicioController'
      controllerAs: 'SubjectInicioController'
    }

new SubjectInicioConfig();
