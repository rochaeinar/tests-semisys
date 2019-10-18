class ProgramInicioController
  'use strict'
  constructor: () ->
    angular
    .module 'program'
    .controller 'ProgramInicioController', [
      'programService'
      'subjectService'
      '$scope'
      '$mdDialog'
      '$state'
      @ProgramInicioController
    ]

  onSuccessGet: (response) =>
    @programs = response.data
    return

  onSuccessGetSubjects: (response) =>
    @subjects = response.data
    return

  showForm: () =>
    @$state.go 'semisysapp.program-register'

  liveDeleteProgram: (e, id) =>
    for item, index in @programs
      if item._id is id
        @programs.splice index, 1
        break

  ProgramInicioController: (programService, subjectService,$scope, $mdDialog, $state) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @$mdDialog = $mdDialog
    @$state = $state
    @showForm = @showForm

    $scope.$on 'liveDeleteProgram', @liveDeleteProgram

    @programService = programService
    @subjectService = subjectService
    @programService.getAll()
    .then @onSuccessGet
    @subjectService.getAll()
    .then @onSuccessGetSubjects

    @vm

new ProgramInicioController()
