DataAccess = require "./data-access"

class StudentDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/student"

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
        @entity.find { 'typeDoc' : 1}, onResult
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
        newItem.rol = 'Estudiante'

        @entity.create newItem, onResult
    @tokenHelper.isValidToken(token, onTokenValid)

module.exports = StudentDataAccess

