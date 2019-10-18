class DocentEditInfoConfig
  'use strict'

  constructor: () ->
    angular
    .module 'docent'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @DocentEditInfoConfig
    ]

  DocentEditInfoConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.docent-edit-info', {
      url: '/docente-editar'
      templateUrl: 'app/docent/docent-edit-info/docent-edit-info-template.html'
      controller: 'DocentEditInfoController'
      controllerAs: 'DocentEditInfoController'
      params: {
        docent: null
      }
    }

new DocentEditInfoConfig();
