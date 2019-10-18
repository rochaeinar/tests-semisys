class AuthoritieInicioController
  'use strict'
  constructor: () ->
    angular
    .module 'authoritie'
    .controller 'AuthoritieInicioController', [
      'authoritieService'
      '$scope'
      '$state'
      @AuthoritieInicioController
    ]

  onSuccessGet: (response) =>
    @authorities = response.data
    return

  showForm: () =>
    @$state.go 'semisysapp.authoritie-register'

  AuthoritieInicioController: (authoritieService,$scope, $state) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @$state = $state
    @showForm = @showForm
    @authoritieService = authoritieService

    @authoritieService.getAll()
    .then @onSuccessGet

    @vm

new AuthoritieInicioController()
