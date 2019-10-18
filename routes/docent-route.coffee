Route = require './route'
class DocentRoute extends Route

  DocentDataAccess = require '../data_access/docent-data-access'
  constructor: (app) ->
    docentDataAccess = new DocentDataAccess app
    super app, '/api/docent', docentDataAccess

module.exports = DocentRoute
