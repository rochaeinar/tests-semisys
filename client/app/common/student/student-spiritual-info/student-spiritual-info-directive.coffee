class StudentSpiritualInfo
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .directive 'studentSpiritualInfo', [
      'churchService'
      @studentSpiritualInfo
    ]

  onSuccessGetChurches: (response) =>
    @scope.listChurches = response.data
    return

  newCharge: (chip) =>
    return charge: chip

  linkFunc: (scope) =>
    @scope = scope
    @vm = this

    @scope.newCharge = @newCharge

    @churchService.getAll()
    .then @onSuccessGetChurches

    return

  studentSpiritualInfo: (churchService)=>
    @churchService = churchService

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/student/student-spiritual-info/student-spiritual-info-template.html'
      link: @linkFunc
      scope:
        student: '=?'

    directive

new StudentSpiritualInfo()
