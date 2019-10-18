Route = require './route'
class StudentRoute extends Route

  StudentDataAccess = require '../data_access/student-data-access'
  constructor: (app) ->
    studentDataAccess = new StudentDataAccess app
    super app, '/api/student', studentDataAccess

module.exports = StudentRoute
