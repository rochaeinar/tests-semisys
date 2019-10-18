class DocentEditInfoController
  'use strict'
  constructor: () ->
    angular
    .module 'docent'
    .controller 'DocentEditInfoController', [
      'docentService'
      '$state'
      '$stateParams'
      @DocentEditInfoController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.docent'
    return

  modify: () =>
    @docentService.update @docent
    .then @onSuccessModifying
    return


  DocentEditInfoController: (docentService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @docent = $stateParams.docent
    @modify = @modify
    @docentService = docentService

    @vm

new DocentEditInfoController()
