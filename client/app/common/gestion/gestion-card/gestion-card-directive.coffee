class GestionCard
  'use strict'
  constructor: () ->
    angular
    .module 'gestion'
    .directive 'gestionCard', [
      '$mdDialog'
      'gestionService'
      'socketService'
      '$state'
      @gestionCard
    ]

  edit: (gestion) =>
    @$state.go 'semisysapp.gestion-edit', {gestion: gestion}

  onSuccessDelete: (id) =>
    @socketService.deleteManagement id
    return

  delete: (id) =>
    @gestionService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @gestion =  scope.gestion
    @scope.delete = @delete
    @scope.edit = @edit
    return

  gestionCard: ($mdDialog, gestionService, socketService,$state)=>
    @$mdDialog = $mdDialog
    @gestionService = gestionService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/gestion/gestion-card/gestion-card-template.html'
      link: @linkFunc
      scope:
        gestion: '='

    directive

new GestionCard()
