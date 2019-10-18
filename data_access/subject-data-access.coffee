DataAccess = require "./data-access"
class SubjectDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/subject"

module.exports = SubjectDataAccess

