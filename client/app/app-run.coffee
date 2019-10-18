class AppRun
  'use strict'

  constructor: () ->
    angular
    .module 'semi'
    .run [
      '$state'
      '$cookies'
      'toaster'
      'Restangular'
      @AppRunner
    ]

  AppRunner: ($state, $cookies, toaster, Restangular) =>
    onErrorIntercepted = (response, deferred, responseHandler) =>
      if response.status == 401 && response.data.message == 'INVALID_TOKEN'
        $cookies.remove 'user'
        toaster.pop 'info', 'La sesion a expirado', "Vuelva a iniciar sesion."
        $state.go 'login'
        false
      if response.status is 500
        toaster.pop 'error', "Error interno", "Ocurrió un problema, pongase en contacto con el administrador"
        false
      true
    Restangular.setErrorInterceptor onErrorIntercepted

    onResponseIntercepted = (data, operation, what, url, response, deferred) =>
      if response.status is 201
        toaster.pop 'success', "Creación exitosa", "El registro se creó exitosamente"
      if response.status is 204
        toaster.pop 'info', "Actualización exitosa", "El registro se actualizó exitosamente"
      if response.status is 205
        toaster.pop 'info', "Eliminación exitosa", "El registro se eliminó exitosamente"
      return data
    Restangular.addResponseInterceptor onResponseIntercepted

new AppRun();
