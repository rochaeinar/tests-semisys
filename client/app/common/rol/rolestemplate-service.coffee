class RolTemplateService
  'use strict'
  constructor: () ->
    extendedFunctions =
      getTemplate: @getTemplate
    @service = new Service 'roltemplate', 'roles', 'rolTemplateService', extendedFunctions

  getTemplate: () =>
    @service.Restangular
    .one 'api'
    .one 'roltemplate'
    .customGET()

new RolTemplateService()
