class DocentRegister
  'use strict'
  constructor: () ->
    angular
    .module 'docent'
    .directive 'docentRegister', [
      'docentService'
      '$state'
      '$mdStepper'
      @docentRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.docent'
    return

  add: () =>
    @scope.docent.password = sha3_512 @scope.docent.ci
    @docentService.add @scope.docent
    .then @onSuccessAdding
    return

  next: () =>
    @$mdStepper('stepper-register').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.docent'
    return

  linkFunc: (scope) =>
    @scope = scope

    @vm = this
    @vm.message = ''

    @scope.docent =
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
      password: ''

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  docentRegister: (docentService, $state,$mdStepper)=>
    @docentService = docentService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/docent/docent-register/docent-register-template.html'
      link: @linkFunc

    directive

new DocentRegister()
