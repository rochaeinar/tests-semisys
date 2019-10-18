DataAccess = require "./data-access"
class UserDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/users"

module.exports = UserDataAccess
