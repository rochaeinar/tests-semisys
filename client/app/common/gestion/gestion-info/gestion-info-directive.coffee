class GestionInfo
  'use strict'
  constructor: () ->
    angular
    .module 'gestion'
    .directive 'gestionInfo', [
      @gestionInfo
    ]


  linkFunc: (scope) =>
    @scope = scope
    @vm = this
    return

  gestionInfo: ()=>

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/gestion/gestion-info/gestion-info-template.html'
      link: @linkFunc
      scope:
        gestion: '=?'

    directive

new GestionInfo()
