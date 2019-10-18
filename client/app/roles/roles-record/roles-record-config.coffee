class RolesRecordConfig
  'use strict'

  constructor: () ->
    angular
    .module 'roles'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @RolesRecordConfig
    ]

  RolesRecordConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.rolesrecord', {
      url: '/rolesrecord'
      templateUrl: 'app/roles/roles-record/roles-record-template.html'
      controller: 'RolesRecordController'
      controllerAs: 'RolesRecordController'
    }

new RolesRecordConfig();
