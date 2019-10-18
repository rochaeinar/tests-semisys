class RolesListConfig
  'use strict'

  constructor: () ->
    angular
    .module 'roles'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @RolesListConfig
    ]

  RolesListConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.roles', {
      url: '/roles'
      templateUrl: 'app/roles/roles-list/roles-list-template.html'
      controller: 'RolesListController'
      controllerAs: 'RolesListController'
    }

new RolesListConfig();
