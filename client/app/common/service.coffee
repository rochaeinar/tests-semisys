class Service
  'use strict'
  constructor: (route, module, serviceName, extendedFunctions) ->
    @extendedFunctions = extendedFunctions
    if route? & route != undefined & module? & module != undefined & serviceName? & serviceName != undefined
      @routeBase = 'api'
      @route = route
      angular
      .module module
      .service serviceName, [
        'Restangular'
        @itemService
      ]

  get: (id) =>
    @Restangular
    .one @routeBase
    .one @route
    .customGET id

  add: (item) =>
    @Restangular
    .one @routeBase
    .one @route
    .customPOST item

  delete: (id) =>
    @Restangular
    .one @routeBase
    .one @route
    .customDELETE id

  getAll: () =>
    @Restangular
    .one @routeBase
    .one @route
    .customGET()

  update: (item) =>
    @Restangular
    .one @routeBase
    .one @route, item._id
    .customPUT item

  itemService: (Restangular) =>
    @Restangular = Restangular
    service = {}
    service.get = @get
    service.add = @add
    service.delete = @delete
    service.getAll = @getAll
    service.update = @update
    service.Restangular = Restangular
    if @extendedFunctions? && @extendedFunctions != undefined
      for key,value of @extendedFunctions
        service[key] = value
    service

