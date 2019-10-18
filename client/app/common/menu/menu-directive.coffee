class Menu
  'use strict'
  constructor: () ->
    angular
    .module 'common'
    .directive 'menuSide', [
      'menuService'
      @menu
    ]

  linkFunc: () =>
    @vm = this
    @acctions = @menuService.mainMenu()
    return

  menu: (menuService)=>
    @menuService = menuService

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/menu/menu-template.html'
      link: @linkFunc

    directive

new Menu()
