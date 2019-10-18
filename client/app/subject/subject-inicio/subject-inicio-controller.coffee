class SubjectInicioController
  'use strict'
  constructor: () ->
    angular
    .module 'subject'
    .controller 'SubjectInicioController', [
      'subjectService'
      '$scope'
      '$mdDialog'
      '$state'
      @SubjectInicioController
    ]

  onSuccessGet: (response) =>
    @subjects = response.data
    return

  showForm: () =>
    @$state.go 'semisysapp.subject-register'

  liveDeleteSubject: (e, id) =>
    for item, index in @subjects
      if item._id is id
        @subjects.splice index, 1
        break

  SubjectInicioController: (subjectService, $scope, $mdDialog, $state) =>
    vm = this
    @vm = vm
    @$scope = $scope
    @$state = $state
    @showForm = @showForm
    @$mdDialog = $mdDialog
    @subjectService = subjectService

    $scope.$on 'liveDeleteSubject', @liveDeleteSubject

    @subjectService.getAll()
    .then @onSuccessGet
    @vm

new SubjectInicioController()
