Route = require './route'
class SubjectRoute extends Route

  SubjectDataAccess = require '../data_access/subject-data-access'
  constructor: (app) ->
    subjectDataAccess = new SubjectDataAccess app
    super app, '/api/subject', subjectDataAccess

module.exports = SubjectRoute