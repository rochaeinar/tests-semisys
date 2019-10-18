DataAccess = require "./data-access"
fs = require 'fs'
config = require '../config'
backup = require 'mongodb-backup'
restore = require 'mongodb-restore'
moment = require 'moment'

class BackupDataAccess extends DataAccess

  constructor: (appReference) ->
    super appReference
    dbConf = config.mongodb
    @mongodbConnection = "mongodb://#{dbConf.host}/#{dbConf.database}"

  getAll: (options, token, response)=>
    onTokenValid = (valid, error) =>
      if(!valid)
        return response false, error
      else
        onReadDir = (error, files) =>
          if error
            console.log error
            return response false, error
          else
            return response files
        fs.readdir config.backup.folder, onReadDir
    @tokenHelper.isValidToken(token, onTokenValid)

  get: (id, token, response)=>
    onTokenValid = (valid, error) =>
      if(!valid)
        return response false, error
      else
        console.log id
        onSuccess = (error) =>
          if error
            console.log error
            return response false, error
          else
            return response id
        restore uri: @mongodbConnection, root: config.backup.folder, callback: onSuccess, tar: id, drop: true
    @tokenHelper.isValidToken(token, onTokenValid)

  post: (newItem, token, response) =>
    onTokenValid = (valid, error) =>
      if(!valid)
        return response false, error
      else
        name = moment().format('YYYY-MM-DD hh.mm.ss') + '.tar'
        onSuccess = (error) =>
          if error
            console.log error
            return response false, error
          else
            return response name
        backup uri: @mongodbConnection, root: config.backup.folder, callback: onSuccess, tar: name
    @tokenHelper.isValidToken(token, onTokenValid)

  put: (id, item, token, response)=>
    return response false, "UNAUTHORIZED"

  delete: (id, item, token, response)=>
    filePath = config.backup.folder + id
    onDelete = (error) =>
      if error
        console.log error
        return response false, error
      else
        return response id
    fs.unlink(filePath, onDelete)

module.exports = BackupDataAccess
