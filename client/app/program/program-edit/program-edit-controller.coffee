class ProgramEditController
  'use strict'
  constructor: () ->
    angular
    .module 'program'
    .controller 'ProgramEditController', [
      'programService'
      '$state'
      '$stateParams'
      @ProgramEditController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.program'
    return

  modify: () =>
    @programService.update @program
    .then @onSuccessModifying
    return    

  ProgramEditController: (programService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @program = $stateParams.program
    @modify = @modify
    @programService = programService

    @vm

new ProgramEditController()
