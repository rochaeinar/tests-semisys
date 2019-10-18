class DocentRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'docent'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @DocentRegisterConfig
    ]

  DocentRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.docent-register', {
      url: '/docente-registro'
      templateUrl: 'app/docent/docent-register/docent-register-template.html'
      controller: 'DocentRegisterController'
      controllerAs: 'DocentRegisterController'
    }

new DocentRegisterConfig();
