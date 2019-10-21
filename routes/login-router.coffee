class LoginRoute

  bodyParser = require 'body-parser'
  jsonParser = bodyParser.json()
  Responses = require './responses'
  res = new Responses()
  app = null
  loginDataAccess = require '../data_access/login-data-access'

  constructor: (app)->
    app.put "/api/login", jsonParser, @loginUser
    app.put "/api/logout", jsonParser, @logoutUser
    @login = new loginDataAccess()
    app

  loginUser: (request, response) =>
    if request.body.name and request.body.pass and request.body.pass.length > 1
      onSuccess = (data, error) =>
        if data
          res.ok response, data
        else
          res.passwordIncorrect(response)
      @login.login request.body.name, request.body.pass, onSuccess
    else
      return res.invalid(response)

  logoutUser: (request, response)=>
    body = request.body
    body.token = request.headers.token
    body.uid = request.headers.uid
    logout = ()->
      console.log "Logout "
    #MRequest.logoutUser body, logout, response
    res.ok response, logout: "true"

module.exports = LoginRoute
