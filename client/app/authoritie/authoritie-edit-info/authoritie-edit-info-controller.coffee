class AuthoritieEditInfoController
  'use strict'
  constructor: () ->
    angular
    .module 'authoritie'
    .controller 'AuthoritieEditInfoController', [
      'authoritieService'
      '$state'
      '$stateParams'
      @AuthoritieEditInfoController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.authoritie'
    return

  modify: () =>
    @authoritieService.update @authoritie
    .then @onSuccessModifying
    return


  AuthoritieEditInfoController: (authoritieService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @authoritie = $stateParams.authoritie
    @modify = @modify
    @authoritieService = authoritieService

    @vm

new AuthoritieEditInfoController()
