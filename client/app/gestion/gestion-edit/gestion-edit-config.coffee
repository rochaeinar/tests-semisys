class GestionEditConfig
  'use strict'

  constructor: () ->
    angular
    .module 'gestion'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @GestionEditConfig
    ]

  GestionEditConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.gestion-edit', {
      url: '/gestion-academica-editar'
      templateUrl: 'app/gestion/gestion-edit/gestion-edit-template.html'
      controller: 'GestionEditController'
      controllerAs: 'GestionEditController'
      params: {
        gestion: null
      }
    }

new GestionEditConfig();
