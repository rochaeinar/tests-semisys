class DocentCard
  'use strict'
  constructor: () ->
    angular
    .module 'docent'
    .directive 'docentCard', [
      '$mdDialog'
      'docentService'
      'socketService'
      '$state'
      @docentCard
    ]

  showEditPersonalForm: (docent) =>
    @$state.go 'semisysapp.docent-edit-info', {docent: docent}

  onSuccessDelete: (id) =>
    @socketService.deleteDocent id
    return

  delete: (id) =>
    @docentService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @person = scope.person
    @scope.delete = @delete
    @scope.showEditPersonalForm = @showEditPersonalForm
    return

  docentCard: ($mdDialog, docentService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @docentService = docentService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/docent/docent-card/docent-card-template.html'
      link: @linkFunc
      scope:
        person: '='

    directive

new DocentCard()
