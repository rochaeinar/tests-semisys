DataAccess = require "./data-access"
class RolTemplateDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference, "../entities/rol"

  getTemplate: (token, response)=>
    onTokenValid  = (valid, message) =>
      if(!valid)
        return response false, message
      else
        onResult = (error, items) =>
          if error
            console.log error
            return response false, error
          else
            if items.length > 0
              template =
                name: ''
                permissions:  items[0].permissions

              template.permissions.forEach (d, i) ->
                d.view = false
                d.add = false
                d.edit = false
                d.delete = false
            return response template
        @entity.find {}, onResult
    @tokenHelper.isValidToken(token, onTokenValid)

  getAll: (options, token, response)=>
    return response false, "UNAUTHORIZED"

  get: (id, token, response)=>
    return response false, "UNAUTHORIZED"

  post: (newItem, token, response) =>
    return response false, "UNAUTHORIZED"

  put: (id, item, token, response)=>
    return response false, "UNAUTHORIZED"

  delete: (id, item, token, response)=>
    return response false, "UNAUTHORIZED"

module.exports = RolTemplateDataAccess
