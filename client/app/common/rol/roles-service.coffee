class RolesService
  'use strict'
  constructor: () ->
    extendedFunctions =
      setCurrent: @setCurrent
      getCurrent: @getCurrent
      setAddingRol: @setAddingRol
      isAdding: @isAdding
    @service = new Service 'roles', 'roles', 'rolesService', extendedFunctions

  setCurrent: (current) =>
    @current = current

  getCurrent: () =>
    @current

  setAddingRol: (adding) =>
    @adding = adding

  isAdding: () =>
    @adding
new RolesService()
