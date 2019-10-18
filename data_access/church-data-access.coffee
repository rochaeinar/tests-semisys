DataAccess = require "./data-access"
class ChurchDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/church"

module.exports = ChurchDataAccess

