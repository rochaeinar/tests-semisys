class AuthoritieInicioConfig
  'use strict'

  constructor: () ->
    angular
    .module 'authoritie'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @AuthoritieInicioConfig
    ]

  AuthoritieInicioConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.authoritie', {
      url: '/autoridades'
      templateUrl: 'app/authoritie/authoritie-inicio/authoritie-inicio-template.html'
      controller: 'AuthoritieInicioController'
      controllerAs: 'AuthoritieInicioController'
    }

new AuthoritieInicioConfig();
