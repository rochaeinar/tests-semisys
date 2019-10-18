class ProgramRegisterConfig
  'use strict'

  constructor: () ->
    angular
    .module 'program'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @ProgramRegisterConfig
    ]

  ProgramRegisterConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.program-register', {
      url: '/programa-registro'
      templateUrl: 'app/program/program-register/program-register-template.html'
      controller: 'ProgramRegisterController'
      controllerAs: 'ProgramRegisterController'
    }

new ProgramRegisterConfig();
