class BackupCard
  'use strict'
  constructor: () ->
    angular
    .module 'backup'
    .directive 'backupCard', [
      '$mdDialog'
      'backupService'
      'socketService'
      '$state'
      @backupCard
    ]
  restore: (backup) =>
    @backupService.get backup
    .then @onRestore

  onRestore: () =>
    @$state.go 'login'

  onSuccessDelete: (id) =>
    @socketService.deleteBackup id
    @scope.$emit 'backup.reload', id
    return

  delete: (id) =>
    @backupService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @backup = scope.backup
    @scope.delete = @delete
    @scope.restore = @restore
    return

  backupCard: ($mdDialog, backupService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @backupService = backupService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/backup/backup-card/backup-card-template.html'
      link: @linkFunc
      scope:
        backup: '='

    directive

new BackupCard()
