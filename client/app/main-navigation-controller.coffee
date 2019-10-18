class MainNavigationController
  'use strict'
  constructor: () ->
    angular
    .module 'mainNavigation'
    .controller 'mainNavigationController', [
      '$scope'
      '$cookies'
      '$state'
      '$mdDialog'
      '$mdSidenav'
      'appService'
      'rolesHelperService'
      'ROLES'
      'Restangular'
      'menuService'
      @mainNavigationController
    ]

  onLogout: ()=>
    @vm.token = undefined
    @$cookies.put 'reloadLogin', true
    @$cookies.remove 'user'
    @$state.go('login')

  logout: =>
    @appService.logout(@vm.token)
    .then(@onLogout)

  toggleSidenav: (menuId) =>
    @$mdSidenav(menuId).toggle()

  mainNavigationController: ($scope, $cookies, $state, $mdDialog, $mdSidenav, appService, rolesHelperService, ROLES, Restangular, menuService) =>
    @$cookies = $cookies
    @$state = $state
    @$scope = $scope
    @$mdSidenav = $mdSidenav
    @$scope = @showForm
    @$scope = @toggleSidenav
    @appService = appService
    @vm = this

    @vm.setstate = @setstate
    @vm.token = @$cookies.getObject 'user'

    if angular.isUndefined @vm.token
      @$state.go 'login'

    if angular.isDefined @vm.token
      if @vm.token.rol == 'student'
        @$state.go 'student'

    if @$state.is('semisysapp')
      @$state.go 'semisysapp.student'

    @vm.messsage = "User"
    @current = "Estudiantes"

    @menus = menuService.mainMenu()

    @vm

new MainNavigationController();
