class StudentPersonalInfo
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .directive 'studentPersonalInfo', [
      @studentPersonalInfo
    ]

  addNameToList: () =>
    @scope.student.sons.push @scope.nameTemp
    @scope.nameTemp=
      firstName: '',
      lastName: ''
    return

  deleteNameFromList: (index) =>
    @scope.student.sons.splice index, 1
    return

  linkFunc: (scope) =>
    @scope = scope
    @vm = this

    @scope.nameTemp=
      firstNameSon: '',
      secondNameSon: ''

    @scope.addNameToList = @addNameToList
    @scope.deleteNameFromList = @deleteNameFromList

    return

  studentPersonalInfo: ()=>

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/student/student-personal-info/student-personal-info-template.html'
      link: @linkFunc
      scope:
        student: '=?'

    directive

new StudentPersonalInfo()
