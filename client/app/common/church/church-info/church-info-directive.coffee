class ChurchInfo
  'use strict'
  constructor: () ->
    angular
    .module 'church'
    .directive 'churchInfo', [
      @churchInfo
    ]


  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    return

  churchInfo: ()=>

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/church/church-info/church-info-template.html'
      link: @linkFunc
      scope:
        church: '=?'

    directive

new ChurchInfo()
