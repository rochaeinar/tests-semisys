class ProgramRegister
  'use strict'
  constructor: () ->
    angular
    .module 'program'
    .directive 'programRegister', [
      'programService'
      '$state'
      '$mdStepper'
      @programRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.program'
    return

  add: () =>
    @programService.add @scope.program
    .then @onSuccessAdding
    return

  next: () =>
    @$mdStepper('stepper-program').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.program'
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this

    @scope.program =
      name: '',
      code: '',
      subjects: []

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  programRegister: (programService, $state, $mdStepper)=>
    @programService = programService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/program/program-register/program-register-template.html'
      link: @linkFunc

    directive

new ProgramRegister()
