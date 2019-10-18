class StudentInicioController
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .controller 'StudentInicioController', [
      'studentService'
      '$scope'
      '$mdDialog'
      '$state'
      @StudentInicioController
    ]

  onSuccessGet: (response) =>
    @persons = response.data
    return

  showForm: () =>
    @$state.go 'semisysapp.student-register'

  liveDeleteStudent: (e, id) =>
    for person, index in @persons
      if person._id is id
        @persons.splice index, 1
        break

  StudentInicioController: (studentService, $scope, $mdDialog, $state) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @$mdDialog = $mdDialog
    @$state = $state
    @showForm = @showForm
    @studentService = studentService

    $scope.$on 'liveDeleteStudent', @liveDeleteStudent

    @studentService.getAll()
    .then @onSuccessGet

    @vm

new StudentInicioController()
