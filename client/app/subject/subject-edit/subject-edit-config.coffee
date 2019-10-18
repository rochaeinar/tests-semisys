class SubjectEditConfig
  'use strict'

  constructor: () ->
    angular
    .module 'subject'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @SubjectEditConfig
    ]

  SubjectEditConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.subject-edit', {
      url: '/materia-editar'
      templateUrl: 'app/subject/subject-edit/subject-edit-template.html'
      controller: 'SubjectEditController'
      controllerAs: 'SubjectEditController'
      params: {
        subject: null
      }
    }

new SubjectEditConfig();
