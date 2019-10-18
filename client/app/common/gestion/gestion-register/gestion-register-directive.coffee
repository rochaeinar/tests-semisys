class GestionRegister
  'use strict'
  constructor: () ->
    angular
    .module 'gestion'
    .directive 'gestionRegister', [
      'gestionService'
      '$state'
      '$mdStepper'
      @gestionRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.gestion-init'
    return

  add: () =>
    @gestionService.add @scope.gestion
    .then @onSuccessAdding
    return

  next: () =>
    @$mdStepper('stepper-gestion').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.gestion-init'
    return

  linkFunc: (scope) =>
    @scope = scope

    @vm = this
    @vm.message = ''

    @scope.gestion =
      code: '',
      period: '',
      start: '',
      end: ''

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  gestionRegister: (gestionService, $state,$mdStepper)=>
    @gestionService = gestionService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/gestion/gestion-register/gestion-register-template.html'
      link: @linkFunc

    directive

new GestionRegister()
