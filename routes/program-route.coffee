Route = require './route'
class ProgramRoute extends Route

  ProgramDataAccess = require '../data_access/program-data-access'
  constructor: (app) ->
    programDataAccess = new ProgramDataAccess app
    super app, '/api/program', programDataAccess

module.exports = ProgramRoute