Route = require './route'
class GestionRoute extends Route

  GestionDataAccess = require '../data_access/gestion-data-access'
  constructor: (app) ->
    gestionDataAccess = new GestionDataAccess app
    super app, '/api/gestion', gestionDataAccess

module.exports = GestionRoute