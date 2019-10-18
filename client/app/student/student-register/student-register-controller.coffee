class StudentRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .controller 'StudentRegisterController', [
      '$scope'
      @StudentRegisterController
    ]

  StudentRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new StudentRegisterController()
