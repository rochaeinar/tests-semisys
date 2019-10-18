class ChurchRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'church'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @ChurchRegisterConfig
    ]

  ChurchRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.church-register', {
      url: '/iglesia-registro'
      templateUrl: 'app/church/church-register/church-register-template.html'
      controller: 'ChurchRegisterController'
      controllerAs: 'ChurchRegisterController'
    }

new ChurchRegisterConfig();
