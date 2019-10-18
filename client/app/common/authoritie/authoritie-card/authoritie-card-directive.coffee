class AuthoritieCard
  'use strict'
  constructor: () ->
    angular
    .module 'authoritie'
    .directive 'authoritieCard', [
      '$mdDialog'
      'authoritieService'
      'socketService'
      '$state'
      @authoritieCard
    ]

  showEditPersonalForm: (authoritie) =>
    @$state.go 'semisysapp.authoritie-edit-info', {authoritie: authoritie}

  onSuccessDelete: (id) =>
    @socketService.deleteAuthoritie id
    return

  delete: (id) =>
    @authoritieService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @person = scope.person
    @scope.delete = @delete
    @scope.showEditPersonalForm = @showEditPersonalForm
    return

  authoritieCard: ($mdDialog, authoritieService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @authoritieService = authoritieService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/docent/docent-card/docent-card-template.html'
      link: @linkFunc
      scope:
        person: '='

    directive

new AuthoritieCard()
