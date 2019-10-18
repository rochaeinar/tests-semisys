class AppService
  'use strict'
  constructor: () ->
    angular
    .module 'semi'
    .service 'appService', [
      'Restangular'
      '$state'
      'toaster'
      @appService
    ]

  logout: (token) =>
    header =
      token: token.token
      uid: token._id
    @Restangular
    .one 'api'
    .one 'logout'
    .customPUT {}, undefined, undefined, header

  appService: (Restangular, $state, toaster) =>
    @Restangular = Restangular
    appServices = {}
    appServices.logout = @logout
    appServices

new AppService
