class ChurchEditConfig
  'use strict'

  constructor: () ->
    angular
    .module 'church'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @ChurchEditConfig
    ]

  ChurchEditConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.church-edit', {
      url: '/iglesia-editar'
      templateUrl: 'app/church/church-edit/church-edit-template.html'
      controller: 'ChurchEditController'
      controllerAs: 'ChurchEditController'
      params: {
        church: null
      }
    }

new ChurchEditConfig();
