class RolCard
  'use strict'
  constructor: () ->
    angular
    .module 'roles'
    .directive 'rolCard', [
      '$mdDialog'
      'rolesService'
      'socketService'
      '$state'
      @rolCard
    ]
  edit: (rol) =>
    @rolService.setCurrent rol
    @$state.go 'semisysapp.rolesrecord'

  onSuccessDelete: (id) =>
    @socketService.deleteRol id
    @scope.$emit 'rol.delete', id
    return

  delete: (id) =>
    @rolService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @rol = scope.rol
    @scope.delete = @delete
    @scope.edit = @edit
    return

  rolCard: ($mdDialog, rolService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @rolService = rolService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/rol/rol-card/rol-card-template.html'
      link: @linkFunc
      scope:
        rol: '='

    directive

new RolCard()
