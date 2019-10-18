class Loading
  'use strict'
  constructor: () ->
    angular
    .module 'semi'
    .directive 'loading', [
      @loading
    ]

  linkFunc: (scope) =>
    @scope = scope
    @scope.wait = false
    setTimeout ()=>
        @scope.wait = true
      , 1000*10
    return

  loading: ()=>
    directive =
      restrict: 'EA'
      templateUrl: 'app/loading/loading-template.html'
      scope:
        phone: '='
      link: @linkFunc

    directive

new Loading()
