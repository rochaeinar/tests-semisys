class DocentRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'docent'
    .controller 'DocentRegisterController', [
      '$scope'
      @DocentRegisterController
    ]

  DocentRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new DocentRegisterController()
