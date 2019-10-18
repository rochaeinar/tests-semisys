class RolesHelperService
  'use strict'
  constructor: () ->
    angular
    .module 'roles'
    .service 'rolesHelperService', [
      '$cookies'
      @rolesHelperService
    ]

  hasAnyPermission: (permissionKey) =>
    hasPermision = false
    if @vm.rol
      @vm.rol.permissions.forEach (r, i) ->
        if r.key == permissionKey
          hasPermision = r.delete == true || r.edit == true || r.add == true || r.view == true
    hasPermision

  hasDeletePermission: (permissionKey) =>
    hasPermision = false
    if @vm.rol
      @vm.rol.permissions.forEach (r, i) ->
        if r.key == permissionKey
          hasPermision = r.delete == true
    hasPermision

  hasEditPermission: (permissionKey) =>
    hasPermision = false
    if @vm.rol
      @vm.rol.permissions.forEach (r, i) ->
        if r.key == permissionKey
          hasPermision = r.edit == true
    hasPermision

  hasAddPermission: (permissionKey) =>
    hasPermision = false
    if @vm.rol
      @vm.rol.permissions.forEach (r, i) ->
        if r.key == permissionKey
          hasPermision = r.add == true
    hasPermision

  hasViewPermission: (permissionKey) =>
    hasPermision = false
    if @vm.rol
      @vm.rol.permissions.forEach (r, i) ->
        if r.key == permissionKey
          hasPermision = r.view == true
    hasPermision

  rolesHelperService: ($cookies) =>
    @vm = this
    user = $cookies.getObject 'user'
    if user? & angular.isDefined user
      @vm.rol = user.rol

    appServices = {}
    appServices.hasAnyPermission = @hasAnyPermission
    appServices.hasDeletePermission = @hasDeletePermission
    appServices.hasEditPermission = @hasEditPermission
    appServices.hasAddPermission = @hasAddPermission
    appServices.hasViewPermission = @hasViewPermission
    appServices

new RolesHelperService();
