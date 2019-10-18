class AuthoritieRegisterController
  'use strict'
  constructor: () ->
    angular
    .module 'authoritie'
    .controller 'AuthoritieRegisterController', [
      '$scope'
      @AuthoritieRegisterController
    ]

  AuthoritieRegisterController: ($scope) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @vm

new AuthoritieRegisterController()
