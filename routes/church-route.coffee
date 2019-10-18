Route = require './route'
class ChurchRoute extends Route

  ChurchDataAccess = require '../data_access/church-data-access'
  constructor: (app) ->
    churchDataAccess = new ChurchDataAccess app
    super app, '/api/church', churchDataAccess

module.exports = ChurchRoute