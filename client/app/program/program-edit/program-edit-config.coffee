class ProgramEditConfig
  'use strict'

  constructor: () ->
    angular
    .module 'program'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @ProgramEditConfig
    ]

  ProgramEditConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.program-edit', {
      url: '/programa-academico-editar'
      templateUrl: 'app/program/program-edit/program-edit-template.html'
      controller: 'ProgramEditController'
      controllerAs: 'ProgramEditController'
      params: {
        program: null
      }
    }

new ProgramEditConfig();
