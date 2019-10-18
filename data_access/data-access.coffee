class DataAccess
  tokenDataAccess = require "./token-data-access"

  constructor: (appReference, entityModelPath) ->
    app = appReference
    if entityModelPath? & entityModelPath != undefined
      @entity = require entityModelPath
    @tokenHelper = new tokenDataAccess()

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
        @entity.find options, onResult
    @tokenHelper.isValidToken(token, onTokenValid)


  get: (id, token, response)=>
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
        @entity.findById id, onResult
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
        @entity.create newItem, onResult
    @tokenHelper.isValidToken(token, onTokenValid)

  put: (id, item, token, response)=>
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
        delete item._id
        @entity.findByIdAndUpdate id, item, onResult
    @tokenHelper.isValidToken(token, onTokenValid)


  delete: (id, item, token, response)=>
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
        @entity.findByIdAndRemove id, item, onResult
    @tokenHelper.isValidToken(token, onTokenValid)

module.exports = DataAccess
