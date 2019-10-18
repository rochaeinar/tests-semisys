Route = require './route'
class RolRoute extends Route

  RolDataAccess = require '../data_access/rol-data-access'
  constructor: (app) ->
    rolDataAccess = new RolDataAccess app
    super app, '/api/roles', rolDataAccess

module.exports = RolRoute