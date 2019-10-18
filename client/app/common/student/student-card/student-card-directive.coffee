class StudentCard
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .directive 'studentCard', [
      '$mdDialog'
      'studentService'
      'socketService'
      '$state'
      @studentCard
    ]

  showEditSpiritualForm: (student) =>
    @$state.go 'semisysapp.student-edit-spiritual', {student: student}

  showEditPersonalForm: (student) =>
    @$state.go 'semisysapp.student-edit-personal', {student: student}

  onSuccessDelete: (id) =>
    @socketService.deleteStudent id
    return

  delete: (id) =>
    @studentService.delete id
    .then @onSuccessDelete id
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    @person = scope.person
    @scope.delete = @delete
    @scope.showEditSpiritualForm = @showEditSpiritualForm
    @scope.showEditPersonalForm = @showEditPersonalForm
    return

  studentCard: ($mdDialog, studentService, socketService, $state)=>
    @$mdDialog = $mdDialog
    @studentService = studentService
    @socketService = socketService
    @$state = $state

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/student/student-card/student-card-template.html'
      link: @linkFunc
      scope:
        person: '='

    directive

new StudentCard()
