DataAccess = require "./data-access"
class ProgramDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/program"

module.exports = ProgramDataAccess

