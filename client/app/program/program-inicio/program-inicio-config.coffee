class ProgramInicioConfig
  'use strict'

  constructor: () ->
    angular
    .module 'program'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @ProgramInicioConfig
    ]

  ProgramInicioConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.program', {
      url: '/programas'
      templateUrl: 'app/program/program-inicio/program-inicio-template.html'
      controller: 'ProgramInicioController'
      controllerAs: 'ProgramInicioController'
    }

new ProgramInicioConfig();
