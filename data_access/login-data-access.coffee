class LoginDataAccess
  app = null
  config = require '../config'
  users = require '../entities/users'
  rol = require '../entities/rol'
  jwt = require 'jsonwebtoken'
  moment = require 'moment'

  constructor: (appReference) ->
    app = appReference
    moment().format()

  login: (userName, password, response)=>
    find = (error, user) =>
      findRol = (errorInRol, rol) =>
        if error
          console.log errorInRol
          return response false, errorInRol
        else
          token = jwt.sign(user: user.userName, config.token.publicKey, expiresInMinutes: 1440)

          user.token = token
          user.tokenExpiration = moment().add(config.token.lifetime_seconds, 'seconds').toDate();

          onResult = (error, items) =>
            if error
              console.log error
              return response false, error
            else
              fullUser =
                name: user.name
                userName: user.userName
                rol: rol
                email: user.email
                token: token
              return response fullUser
          id = user._id
          delete user._id
          users.findByIdAndUpdate id, user, onResult

      if error | !user? | !user
        console.log error
        return response false, error
      else
        rol.findOne {
          name: user.rol
        }, findRol

    users.findOne {
      'userName': userName
      'password': password
    }, find

module.exports = LoginDataAccess
