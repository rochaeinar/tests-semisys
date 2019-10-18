class SubjectRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'subject'
    .controller 'SubjectRegisterController', [
      '$scope'
      @SubjectRegisterController
    ]

  SubjectRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new SubjectRegisterController()
