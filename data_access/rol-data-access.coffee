DataAccess = require "./data-access"
class RolDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/rol"
    
#  geTemplate: (options, token, response) ->
#    getAll (options, token, response)

module.exports = RolDataAccess
