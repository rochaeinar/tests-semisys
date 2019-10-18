class AuthoritieEditInfoConfig
  'use strict'

  constructor: () ->
    angular
    .module 'authoritie'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @AuthoritieEditInfoConfig
    ]

  AuthoritieEditInfoConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.authoritie-edit-info', {
      url: '/authoritiee-editar'
      templateUrl: 'app/authoritie/authoritie-edit-info/authoritie-edit-info-template.html'
      controller: 'AuthoritieEditInfoController'
      controllerAs: 'AuthoritieEditInfoController'
      params: {
        authoritie: null
      }
    }

new AuthoritieEditInfoConfig();
