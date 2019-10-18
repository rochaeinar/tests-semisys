class ProgramInfo
  'use strict'
  constructor: () ->
    angular
    .module 'program'
    .directive 'programInfo', [
      'subjectService'
      @programInfo
    ]

  onSuccessGetSubjects: (response) =>
    @scope.listSubjects = response.data
    return

  addItem: () =>
    @scope.program.subjects.push @scope.item
    @scope.item =
       id: ''
    return

  deleteItemFromList: (index) =>
    @scope.program.subjects.splice index, 1
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this

    @scope.item =
      id: ''

    @scope.addItem = @addItem
    @scope.deleteItemFromList = @deleteItemFromList
    @subjectService.getAll()
    .then @onSuccessGetSubjects

    return

  programInfo: (subjectService)=>
    @subjectService = subjectService

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/program/program-info/program-info-template.html'
      link: @linkFunc
      scope:
        program: '=?'

    directive

new ProgramInfo()
