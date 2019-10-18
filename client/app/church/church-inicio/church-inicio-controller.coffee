class ChurchInicioController
  'use strict'
  constructor: () ->
    angular
    .module 'church'
    .controller 'ChurchInicioController', [
      'churchService'
      '$scope'
      '$state'
      @ChurchInicioController
    ]

  onSuccessGet: (response) =>
    @church = response.data
    return

  showAddForm: () =>
    @$state.go 'semisysapp.church-register'

  liveDeleteChurch: (e, id) =>
    for item, index in @church
      if item._id is id
        @church.splice index, 1
        break

  ChurchInicioController: (churchService, $scope, $state) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @$state = $state
    @showAddForm = @showAddForm
    @churchService = churchService

    $scope.$on 'liveDeleteChurch', @liveDeleteChurch

    @churchService.getAll()
    .then @onSuccessGet

    @vm

new ChurchInicioController()
