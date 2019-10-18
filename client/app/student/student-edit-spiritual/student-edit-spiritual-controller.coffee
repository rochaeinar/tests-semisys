class StudentEditSpiritualController
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .controller 'StudentEditSpiritualController', [
      'studentService'
      '$state'
      '$stateParams'
      @StudentEditSpiritualController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.student'
    return

  modify: () =>
    @studentService.update @student
    .then @onSuccessModifying
    return

  StudentEditSpiritualController: (studentService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @student = $stateParams.student
    @modify = @modify
    @studentService = studentService

    @vm

new StudentEditSpiritualController()
