class GestionRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'gestion'
    .controller 'GestionRegisterController', [
      '$scope'
      @GestionRegisterController
    ]

  GestionRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new GestionRegisterController()
