class LoginController
  'use strict'
  constructor: () ->
    angular
    .module 'login'
    .controller 'loginController', [
      'loginService'
      '$state'
      '$cookies'
      '$scope'
      @Controller
    ]

  verifyPass: (pass)=>
    @vm.needChangePass = false
    re = /[0-9]/
    if !re.test pass
      @vm.needChangePass = true
    re = /[a-z]/
    if !re.test pass
      @vm.needChangePass = true
    re = /[A-Z]/
    if  !re.test pass
      @vm.needChangePass = true
    if  pass.length < 8
      @vm.needChangePass = true

  verifyUserChangePass: (user)=>
    if angular.isUndefined user.changeDate
      @vm.needChangePass = true
    else
      currentDate = new Date()
      lastDate = new Date user.changeDate
      dif = currentDate - lastDate
      days = Math.floor dif / (1000 * 60 * 60 * 24)
      if days >= 30
        @vm.needChangePass = true
    return

  onSuccessLogin: (response) =>
    if response? && angular.isDefined response.data && angular.isDefined response.data.token
      @$cookies.putObject 'user', response.data
      @vm.username = ""
      @vm.password = ""
      @$state.go 'semisysapp'
    else
      @vm.password = null
      @vm.error = true
      @vm.message = "El nombre de usuario ó contraseña no es válido."
      @$cookies.remove 'user'

    @vm.request = false
    return

  onErrorLogin: (error) =>
    @vm.request = false
    if error.status is 404
      @vm.password = null
      @vm.error = true
      @vm.message = "El nombre de usuario ó contraseña no es válido."
    if error.status is 401
      @vm.lock = error.data.data
      @$cookies.put 'lock', @vm.lock
      @vm.password = null
      @$state.go 'attempt'
    return

  login: (user, pass) =>
    @vm.notValid = false
    if user is null or user is "" or angular.isUndefined user
      @vm.message = "El usuario no puede estar en blanco"
      return
    if pass is null or pass is "" or angular.isUndefined pass
      @vm.message = "La contraseña no puede estar en blanco"
      return
    if @vm.message is ""
      @vm.request = true
      @verifyPass(pass)
      pass = sha3_512 pass
      @loginService.login user, pass
      .then @onSuccessLogin
      .catch @onErrorLogin
    return

  updateUser: =>
    @vm.message = ""
    @vm.messageErrorUser = ""
    @vm.errorUser = false
    @vm.error = false

  updatePass: (pass)=>
    if pass?
      @vm.message = ""
      @vm.messageErrorPassword = ""
      @vm.errorPass = false
      @vm.error = false

  Controller: (loginService, $state, $cookies, $scope) =>
    vm = this
    if($cookies.get 'reloadLogin')
      $cookies.remove 'reloadLogin'
      location.reload()
    @vm = vm
    @vm.needChangePass = false
    @loginService = loginService
    @$state = $state
    @$cookies = $cookies
    @vm.token = @$cookies.getObject 'user'
    @vm.lock = @$cookies.get 'lock'
    @vm.username = "admin"
    @vm.password = "admin"
    @vm.message = ''
    @vm.messageErrorUser = ""
    @vm.messageErrorPassword = ""
    @vm.error = false
    @vm.errorUser = false
    @vm.errorPass = false
    @vm.request = false
    @vm.login = @login
    $scope.$watch 'loginController.username', @updateUser
    $scope.$watch 'loginController.password', @updatePass

    if angular.isDefined @vm.token
      if @vm.token.rol == 'administrator'
        @$state.go 'semisysapp'
      if @vm.token.rol == 'student'
        @$state.go 'student'

    @vm

new LoginController()
