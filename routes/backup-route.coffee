Route = require './route'

class BackupRoute extends Route

  BackupDataAccess = require '../data_access/backup-data-access'
  constructor: (app) ->
    backupDataAccess = new BackupDataAccess app
    super app, '/api/backup', backupDataAccess, get: true, getAll: true, post: true, delete: true

module.exports = BackupRoute