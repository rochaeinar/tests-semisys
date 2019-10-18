class StudentEditPersonalController
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .controller 'StudentEditPersonalController', [
      'studentService'
      '$state'
      '$stateParams'
      @StudentEditPersonalController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.student'
    return

  modify: () =>
    @studentService.update @student
    .then @onSuccessModifying
    return

  StudentEditPersonalController: (studentService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @student = $stateParams.student
    @modify = @modify
    @studentService = studentService

    @vm

new StudentEditPersonalController()
