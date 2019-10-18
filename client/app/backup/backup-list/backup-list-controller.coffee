class BackupListController
  'use strict'
  constructor: () ->
    angular
    .module 'backup'
    .controller 'BackupListController', [
      'backupService'
      '$state'
      '$rootScope'
      '$scope'
      @BackupListController
    ]

  onSuccessGet: (response) =>
    @backup = response.data
    return

  add: () =>
    @backupService.add()
    .then @loadBackup

  loadBackup: () =>
    @backupService.getAll()
    .then @onSuccessGet

  BackupListController: (backupService, $state, $rootScope, $scope) =>
    vm = this
    @vm = vm
    @vm.$scope = $scope
    @vm.add = @add
    @vm.$state = $state
    @vm.backupService = backupService

    $rootScope.$on 'backup.reload', @loadBackup

    @loadBackup()

    @vm

new BackupListController()
