class GestionInitController
  'use strict'
  constructor: () ->
    angular
    .module 'gestion'
    .controller 'GestionInitController', [
      'gestionService'
      '$scope'
      '$state'
      @GestionInitController
    ]

  onSuccessGet: (response) =>
    @gestions = response.data
    return

  add: () =>
    @$state.go 'semisysapp.gestion-register'

  liveDeleteGestion: (e, id) =>
    for item, index in @gestions
      if item._id is id
        @gestions.splice index, 1
        break

  GestionInitController: (gestionService, $scope, $state) =>
    vm = this
    @vm = vm
    @gestionService = gestionService
    @$scope = $scope
    @$state = $state
    @add = @add

    $scope.$on 'liveDeleteGestion', @liveDeleteGestion

    @gestionService.getAll()
    .then @onSuccessGet

    @vm

new GestionInitController()
