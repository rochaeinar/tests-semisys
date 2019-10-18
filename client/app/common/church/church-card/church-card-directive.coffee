class ChurchCard
  'use strict'
  constructor: () ->
    angular
    .module 'church'
    .directive 'churchCard', [
      '$mdDialog'
      'churchService'
      'socketService'
      '$state'
      @churchCard
    ]

  showEditForm: (church) =>
    @$state.go 'semisysapp.church-edit', {church: church}

  onSuccessDelete: (id) =>
    @socketService.deleteChurch id
    return

  delete: (id) =>
    @churchService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @church = scope.church
    @scope.delete = @delete
    @scope.showEditForm = @showEditForm
    return

  churchCard: ($mdDialog, churchService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @churchService = churchService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/church/church-card/church-card-template.html'
      link: @linkFunc
      scope:
        church: '='

    directive

new ChurchCard()
