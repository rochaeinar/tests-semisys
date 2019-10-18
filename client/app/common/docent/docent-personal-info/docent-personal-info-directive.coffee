class DocentPersonalInfo
  'use strict'
  constructor: () ->
    angular
    .module 'docent'
    .directive 'docentPersonalInfo', [
      @docentPersonalInfo
    ]


  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    return

  docentPersonalInfo: ()=>

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/docent/docent-personal-info/docent-personal-info-template.html'
      link: @linkFunc
      scope:
        docent: '=?'

    directive

new DocentPersonalInfo()
