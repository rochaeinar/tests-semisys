class AuthoritieInfo
  'use strict'
  constructor: () ->
    angular
    .module 'authoritie'
    .directive 'authoritieInfo', [
      @authoritieInfo
    ]


  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    return

  authoritieInfo: ()=>

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/authoritie/authoritie-info/authoritie-info-template.html'
      link: @linkFunc
      scope:
        authoritie: '=?'

    directive

new AuthoritieInfo()
