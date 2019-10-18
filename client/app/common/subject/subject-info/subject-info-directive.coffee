class SubjectInfo
  'use strict'
  constructor: () ->
    angular
    .module 'subject'
    .directive 'subjectInfo', [
      @subjectInfo
    ]


  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    return

  subjectInfo: ()=>

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/subject/subject-info/subject-info-template.html'
      link: @linkFunc
      scope:
        subject: '=?'

    directive

new SubjectInfo()
