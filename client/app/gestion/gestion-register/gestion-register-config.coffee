class GestionRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'gestion'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @GestionRegisterConfig
    ]

  GestionRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.gestion-register', {
      url: '/crear-gestion-academica'
      templateUrl: 'app/gestion/gestion-register/gestion-register-template.html'
      controller: 'GestionRegisterController'
      controllerAs: 'GestionRegisterController'
    }

new GestionRegisterConfig();
