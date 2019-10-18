class ChurchRegister
  'use strict'
  constructor: () ->
    angular
    .module 'church'
    .directive 'churchRegister', [
      'churchService'
      '$state'
      '$mdStepper'
      @churchRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.church'
    return

  add: () =>
    @churchService.add @scope.church
    .then @onSuccessAdding
    return

  next: () =>
    @$mdStepper('stepper-church').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.church'
    return

  linkFunc: (scope) =>
    @scope = scope

    @vm = this
    @vm.message = ''

    @scope.church =
      name: '',
      address: '',
      city: '',
      denomination: ''

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  churchRegister: (churchService, $state,$mdStepper)=>
    @churchService = churchService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/church/church-register/church-register-template.html'
      link: @linkFunc

    directive

new ChurchRegister()
