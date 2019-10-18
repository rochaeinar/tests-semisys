class RolesListController
  'use strict'
  constructor: () ->
    angular
    .module 'roles'
    .controller 'RolesListController', [
      'rolesService'
      '$state'
      '$rootScope'
      @RolesListController
    ]

  onSuccessGet: (response) =>
    @roles = response.data
    return

  add: () =>
    @rolesService.setCurrent(undefined)
    @rolesService.setAddingRol(true)
    @$state.go 'semisysapp.rolesrecord'
    return

  loadRoles: () =>
    @rolesService.getAll()
    .then @onSuccessGet

  RolesListController: (rolesService, $state, $rootScope) =>
    vm = this
    @vm = vm
    @vm.add = @add
    @vm.$state = $state
    @vm.rolesService = rolesService

    $rootScope.$on 'rol.delete', @loadRoles

    @loadRoles()

    @vm

new RolesListController()
