class GestionEditController
  'use strict'
  constructor: () ->
    angular
    .module 'gestion'
    .controller 'GestionEditController', [
      'gestionService'
      '$state'
      '$stateParams'
      @GestionEditController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.gestion-init'
    return

  modify: () =>
    @gestionService.update @gestion
    .then @onSuccessModifying
    return

  GestionEditController: (gestionService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @gestion = $stateParams.gestion
    @modify = @modify
    @gestionService = gestionService

    @vm

new GestionEditController()
