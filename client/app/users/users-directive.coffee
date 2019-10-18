class Users
  'use strict'
  constructor: () ->
    angular
    .module 'semi'
    .directive 'users', [
      '$state'
      '$cookies'
      'appService'
      @users
    ]

  logout: =>
    @$cookies.remove 'user'
    @$state.go 'login'
    @appService.logout @scope.token
    @scope.clear()
    return

  setPassword: =>
    @$state.go 'setp'

  adminUser: =>
    @$state.go 'user'
    return

  showCollector: =>
    @$state.go 'collector'

  linkFunc: (scope) =>
    @scope = scope
    @scope.logout = @logout
    @scope.adminUser = @adminUser
    @scope.setPassword = @setPassword
    @scope.showCollector = @showCollector
    return

  users: ($state, $cookies, appService)=>
    @$cookies = $cookies
    @$state = $state
    @appService = appService
    directive =
      restrict: 'EA'
      templateUrl: 'app/users/users-template.html'
      scope:
        token: '='
        message: '='
      link: @linkFunc

    directive

new Users()
