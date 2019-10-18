class Responses

  constructor: () ->

  get: (response, statusCode, message, data)=>
    res =
      status: statusCode
      message: message
      data: data
    response.statusCode = res.status
    response.send res

  ok: (response, data)=>
    res =
      status: 200
      message: 'OK'
      data: data
    response.statusCode = res.status
    response.send res

  created: (response, data)=>
    res =
      status: 201
      message: 'Successful creation'
      data: data
    response.statusCode = res.status
    response.send res

  updated: (response, data)=>
    res =
      status: 204
      message: 'Successful update'
      data: data
    response.statusCode = res.status
    response.send res

  deleted: (response, data)=>
    res =
      status: 205
      message: 'Successful deletion'
      data: data
    response.statusCode = res.status
    response.send res

  unauthorized: (response, message)=>
    if !message? | typeof message == 'undefined'
      message = 'ERROR: Unauthorized: The server requires authorization to fulfill the request.'
    res =
      status: 401
      message: message
      data: {}
    response.statusCode = res.status
    response.send res

  error: (response, message)=>
    if message == "UNAUTHORIZED" || message == "INVALID_TOKEN"
      return @unauthorized(response, message)
    if !message
      message = 'ERROR: Internal error'
    else
      if message.message
        message = message.message
    res =
      status: 500
      message: message
      data: {}
    response.statusCode = res.status
    response.send res

  notFound: (response)=>
    res =
      status: 404
      message: 'ERROR: Not Found'
      data: {}
    response.statusCode = res.status
    response.send res

  invalid: (response, message)=>
    if !message
      message = 'ERROR Validation error'
    else
      if message.message
        message = message.message
    res =
      status: 400
      message: message
      data: {}
    response.statusCode = res.status
    response.send res

  alreadyExists: (response)=>
    res =
      status: 400
      message: 'Item already exists'
      data: {}
    response.statusCode = res.status
    response.send res

  passwordIncorrect: (response)=>
    res =
      status: 400
      message: 'User/Password Incorrect'
      data: {}
    response.statusCode = res.status
    response.send res

module.exports = Responses
