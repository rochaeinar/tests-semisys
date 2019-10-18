class DocentInicioController
  'use strict'
  constructor: () ->
    angular
    .module 'docent'
    .controller 'DocentInicioController', [
      'docentService'
      '$scope'
      '$state'
      @DocentInicioController
    ]

  onSuccessGet: (response) =>
    @docents = response.data
    return

  showForm: () =>
    @$state.go 'semisysapp.docent-register'

  liveDeleteDocent: (e, id) =>
    for person, index in @docents
      if person._id is id
        @docents.splice index, 1
        break

  DocentInicioController: (docentService,$scope, $state) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @$state = $state
    @showForm = @showForm
    @docentService = docentService

    $scope.$on 'liveDeleteDocent', @liveDeleteDocent

    @docentService.getAll()
    .then @onSuccessGet

    @vm

new DocentInicioController()
