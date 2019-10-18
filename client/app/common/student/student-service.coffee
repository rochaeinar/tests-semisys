class StudentService
  'use strict'
  constructor: () ->
    @service = new Service 'student', 'student', 'studentService'

new StudentService()