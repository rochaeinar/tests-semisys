class ChurchRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'church'
    .controller 'ChurchRegisterController', [
      '$scope'
      @ChurchRegisterController
    ]

  ChurchRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new ChurchRegisterController()
