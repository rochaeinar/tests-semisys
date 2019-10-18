class ProgramCard
  'use strict'
  constructor: () ->
    angular
    .module 'program'
    .directive 'programCard', [
      '$mdDialog'
      'programService'
      'socketService'
      '$state'
      @programCard
    ]
  showEditForm: (program) =>
    @$state.go 'semisysapp.program-edit', {program: program}

  onSuccessDelete: (id) =>
    @socketService.deleteProgram id
    return

  delete: (id) =>
    @programService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @program = scope.program
    @subjects = scope.subjects
    @scope.delete = @delete
    @scope.showEditForm = @showEditForm
    return

  programCard: ($mdDialog, programService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @programService = programService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/program/program-card/program-card-template.html'
      link: @linkFunc
      scope:
        program: '=',
        subjects: '='

    directive

new ProgramCard()
