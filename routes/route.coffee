class Route

  bodyParser = require 'body-parser'
  jsonParser = bodyParser.json limit: '50mb'
  Responses = require './responses'

  constructor: (app, route, dataAccess_, enabledMethods) ->

    if enabledMethods == undefined
      enabledMethods =
        get: true
        getAll: true
        put: true
        post: true
        delete: true

    @dataAccess = dataAccess_
    @res = new Responses()
    if enabledMethods.getAll
      app.get route, @getAll
    if enabledMethods.get
      app.get route + '/:id', @get
    if enabledMethods.put
      app.put route + "/:id", @put
    if enabledMethods.post
      app.post route, jsonParser, @post
    if enabledMethods.delete
      app.delete route + "/:id", @delete
    app

  getAll: (request, response) =>
    token = request.headers.token
    onSuccess = (data, error) =>
      if error
        @res.error response, error
      else
        @res.ok response, data
    @dataAccess.getAll {}, token, onSuccess

  get: (request, response) =>
    token = request.headers.token
    onSuccess = (data, error) =>
      if error
        @res.error response, error
      else
        @res.ok response, data
    @dataAccess.get request.params.id, token, onSuccess

  put: (request, response) =>
    token = request.headers.token
    onSuccess = (data, error) =>
      if error
        @res.error response, error
      else
        @res.updated response, data
    @dataAccess.put request.params.id, request.body, token, onSuccess

  post: (request, response) =>
    token = request.headers.token
    onSuccess = (data, error) =>
      if error
        @res.error response, error
      else
        @res.created response, data
    @dataAccess.post request.body, token, onSuccess

  delete: (request, response) =>
    token = request.headers.token
    onSuccess = (data, error) =>
      if error
        @res.error response, error
      else
        @res.deleted response, data
    @dataAccess.delete request.params.id, request.body, token, onSuccess

module.exports = Route
