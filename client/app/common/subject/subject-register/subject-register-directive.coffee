class SubjectRegister
  'use strict'
  constructor: () ->
    angular
    .module 'subject'
    .directive 'subjectRegister', [
      'subjectService'
      '$state'
      '$mdStepper'
      @subjectRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.subject'
    return

  add: () =>
    @subjectService.add @scope.subject
    .then @onSuccessAdding
    return

  next: () =>
    @$mdStepper('stepper-subject').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.subject'
    return

  linkFunc: (scope) =>
    @scope = scope

    @vm = this
    @vm.message = ''

    @scope.subject =
      name: '',
      code: ''

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  subjectRegister: (subjectService, $state,$mdStepper)=>
    @subjectService = subjectService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/subject/subject-register/subject-register-template.html'
      link: @linkFunc

    directive

new SubjectRegister()
