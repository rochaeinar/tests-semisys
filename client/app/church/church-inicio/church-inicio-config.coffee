class ChurchInicioConfig
  'use strict'

  constructor: () ->
    angular
    .module 'church'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @ChurchInicioConfig
    ]

  ChurchInicioConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.church', {
      url: '/iglesias'
      templateUrl: 'app/church/church-inicio/church-inicio-template.html'
      controller: 'ChurchInicioController'
      controllerAs: 'ChurchInicioController'
    }

new ChurchInicioConfig();
