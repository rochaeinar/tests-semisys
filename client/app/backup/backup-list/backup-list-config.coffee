class BackupListConfig
  'use strict'

  constructor: () ->
    angular
    .module 'backup'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @BackupListConfig
    ]

  BackupListConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.backup', {
      url: '/backup'
      templateUrl: 'app/backup/backup-list/backup-list-template.html'
      controller: 'BackupListController'
      controllerAs: 'BackupListController'
    }

new BackupListConfig();
