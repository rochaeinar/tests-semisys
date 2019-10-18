class ChurchEditController
  'use strict'
  constructor: () ->
    angular
    .module 'church'
    .controller 'ChurchEditController', [
      'churchService'
      '$state'
      '$stateParams'
      @ChurchEditController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.church'
    return

  modify: () =>
    @churchService.update @church
    .then @onSuccessModifying
    return

  ChurchEditController: (churchService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @church = $stateParams.church
    @modify = @modify
    @churchService = churchService

    @vm

new ChurchEditController()
