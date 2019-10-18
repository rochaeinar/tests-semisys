DataAccess = require "./data-access"
class GestionDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/gestion"

module.exports = GestionDataAccess

