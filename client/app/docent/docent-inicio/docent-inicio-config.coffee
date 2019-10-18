class DocentInicioConfig
  'use strict'

  constructor: () ->
    angular
    .module 'docent'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @DocentInicioConfig
    ]

  DocentInicioConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.docent', {
      url: '/docentes'
      templateUrl: 'app/docent/docent-inicio/docent-inicio-template.html'
      controller: 'DocentInicioController'
      controllerAs: 'DocentInicioController'
    }

new DocentInicioConfig();
