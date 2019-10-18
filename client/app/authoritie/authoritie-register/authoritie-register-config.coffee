class AuthoritieRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'authoritie'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @AuthoritieRegisterConfig
    ]

  AuthoritieRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.authoritie-register', {
      url: '/autoridad-registro'
      templateUrl: 'app/authoritie/authoritie-register/authoritie-register-template.html'
      controller: 'AuthoritieRegisterController'
      controllerAs: 'AuthoritieRegisterController'
    }

new AuthoritieRegisterConfig();
