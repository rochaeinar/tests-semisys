class TokenDataAccess
  app = null
  users = require '../entities/users'
  jwt = require 'jsonwebtoken'
  config = require '../config'
  moment = require 'moment'

  constructor: (appReference) ->
    app = appReference

  isValidToken: (token, response)=>
    if token?
      if token.length > 0
        find = (error, item) =>
          if error
            console.log error
            response false, 'INVALID_TOKEN'
          else
            if item?
              if item.token == token
                onVerify = (error, decoded) =>
                  if error
                    console.log error
                    response false, 'INVALID_TOKEN'
                  else
                    if decoded
                      if item.tokenExpiration.getTime() > moment().toDate().getTime()
                        item.tokenExpiration = moment().add(config.token.lifetime_seconds, 'seconds').toDate();
                        onResult = (error, items) =>
                          if error
                            console.log error
                            response false, 'INVALID_TOKEN'
                          else
                            response true
                        id = item._id
                        delete item._id
                        users.findByIdAndUpdate id, item, onResult
                      else
                        response false, 'INVALID_TOKEN'
                jwt.verify(token, config.token.publicKey, onVerify)
            else
              response false, 'INVALID_TOKEN'
        users.findOne {
          'token': token
        }, find
      else
        response false, 'INVALID_TOKEN'
    else
      response false, 'INVALID_TOKEN'

module.exports = TokenDataAccess
