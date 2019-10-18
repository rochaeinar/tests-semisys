class ProgramRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'program'
    .controller 'ProgramRegisterController', [
      '$scope'
      @ProgramRegisterController
    ]

  ProgramRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new ProgramRegisterController()
