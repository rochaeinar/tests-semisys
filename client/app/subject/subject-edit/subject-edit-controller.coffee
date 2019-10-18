class SubjectEditController
  'use strict'
  constructor: () ->
    angular
    .module 'subject'
    .controller 'SubjectEditController', [
      'subjectService'
      '$state'
      '$stateParams'
      @SubjectEditController
    ]

  onSuccessModifying: (response) =>
    @$state.go 'semisysapp.subject'
    return

  modify: () =>
    @subjectService.update @subject
    .then @onSuccessModifying
    return

  SubjectEditController: (subjectService, $state, $stateParams) =>
    vm = this
    @vm = vm
    @$state = $state
    @subject = $stateParams.subject
    @modify = @modify
    @subjectService = subjectService

    @vm

new SubjectEditController()
