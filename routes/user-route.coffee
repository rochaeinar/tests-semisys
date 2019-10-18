Route = require './route'
class UserRoute extends Route

  UserDataAccess = require '../data_access/user-data-access'
  constructor: (app) ->
    userDataAccess = new UserDataAccess app
    super app, '/api/users', userDataAccess

module.exports = UserRoute
