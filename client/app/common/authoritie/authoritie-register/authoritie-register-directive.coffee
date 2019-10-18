class AuthoritieRegister
  'use strict'
  constructor: () ->
    angular
    .module 'authoritie'
    .directive 'authoritieRegister', [
      'authoritieService'
      '$state'
      '$mdStepper'
      @authoritieRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.authoritie'
    return

  add: () =>
    @scope.authoritie.password =  sha3_512 @scope.authoritie.ci
    @authoritieService.add @scope.authoritie
    .then @onSuccessAdding
    return

  next: () =>
    @$mdStepper('stepper-register').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.authoritie'
    return

  linkFunc: (scope) =>
    @scope = scope

    @vm = this
    @vm.message = ''

    @scope.authoritie =
      photo: '',
      firstName: '',
      lastName: '',
      mail: '',
      phone: null,
      movile: null,
      ci: '',
      civilState: false,
      birthDate: null,
      birtCity: '',
      academicDegree: '',
      rol: '',
      password: ''

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  authoritieRegister: (authoritieService, $state,$mdStepper)=>
    @authoritieService = authoritieService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/authoritie/authoritie-register/authoritie-register-template.html'
      link: @linkFunc

    directive

new AuthoritieRegister()
