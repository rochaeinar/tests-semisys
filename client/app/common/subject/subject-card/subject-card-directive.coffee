class SubjectCard
  'use strict'
  constructor: () ->
    angular
    .module 'subject'
    .directive 'subjectCard', [
      '$mdDialog'
      'subjectService'
      'socketService'
      '$state'
      @subjectCard
    ]

  showEditForm: (subject) =>
    @$state.go 'semisysapp.subject-edit', {subject: subject}

  onSuccessDelete: (id) =>
    @socketService.deleteSubject id
    return

  delete: (id) =>
    @subjectService.delete id
    .then @onSuccessDelete id
    return


  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @subject = scope.subject
    @scope.delete = @delete
    @scope.showEditForm = @showEditForm
    return

  subjectCard: ($mdDialog, subjectService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @subjectService = subjectService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/subject/subject-card/subject-card-template.html'
      link: @linkFunc
      scope:
        subject: '='

    directive

new SubjectCard()
