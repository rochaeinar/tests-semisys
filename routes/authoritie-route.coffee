Route = require './route'
class AuthoritieRoute extends Route

  AuthoritieDataAccess = require '../data_access/authoritie-data-access'
  constructor: (app) ->
    authoritieDataAccess = new AuthoritieDataAccess app
    super app, '/api/authoritie', authoritieDataAccess

module.exports = AuthoritieRoute
