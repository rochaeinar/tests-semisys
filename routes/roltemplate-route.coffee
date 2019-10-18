Route = require './route'
class RolRoute extends Route

  RolTemplateDataAccess = require '../data_access/roltemplate-data-access'
  constructor: (app) ->
    roltemplateDataAccess = new RolTemplateDataAccess app
    super app, '/api/roltemplate', roltemplateDataAccess, getAll: true

  getAll: (request, response) =>
    token = request.headers.token
    onSuccess = (data, error) =>
      if error
        @res.error response, error
      else
        @res.ok response, data
    @dataAccess.getTemplate token, onSuccess

module.exports = RolRoute