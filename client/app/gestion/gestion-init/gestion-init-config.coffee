class GestionInitConfig
  'use strict'

  constructor: () ->
    angular
    .module 'gestion'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @GestionInitConfig
    ]

  GestionInitConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.gestion-init', {
      url: '/gestion-academica'
      templateUrl: 'app/gestion/gestion-init/gestion-init-template.html'
      controller: 'GestionInitController'
      controllerAs: 'GestionInitController'
    }

new GestionInitConfig();
