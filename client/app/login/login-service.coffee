class LoginService
  'use strict'
  constructor: () ->
    angular
     .module 'login'
     .service 'loginService', [
        'Restangular'
        '$state'
        'toaster'
        @loginService
      ]

  login: (userToLogin, pass) =>
    user =
     name: userToLogin
     pass: pass
    @Restangular
      .one 'api'
      .one 'login'
      .customPUT user

  loginService: (Restangular, $state, toaster) =>
    @Restangular = Restangular
    vm = this
    appServices = {}
    appServices.login = @login
    appServices

new LoginService();
