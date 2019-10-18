DataAccess = require "./data-access"

class AuthoritieDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/authoritie"

  getAll: (options, token, response)=>
    onTokenValid = (valid, error) =>
      if(!valid)
        return response false, error
      else
        onResult = (error, items) =>
          if error
            console.log error
            return response false, error
          else
            return response items
        @entity.find { 'typeDoc' : 3}, onResult
    @tokenHelper.isValidToken(token, onTokenValid)

  post: (newItem, token, response) =>
    onTokenValid = (valid, error) =>
      if(!valid)
        return response false, error
      else
        onResult = (error, items) =>
          if error
            console.log error
            return response false, error
          else
            return response items

        newItem.userName = newItem.ci

        @entity.create newItem, onResult
    @tokenHelper.isValidToken(token, onTokenValid)

module.exports = AuthoritieDataAccess

