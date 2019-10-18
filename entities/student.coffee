mongoose = require 'mongoose'
Schema = mongoose.Schema

class Student

  @load: () ->
    entity = new Schema
      typeDoc:
        type: Number
        default: 1
      photo:
        type: String
      firstName:
        type: String
      lastName:
        type: String
      mail:
        type: String
      phone:
        type: Number
      movile:
        type: Number
      ci:
        type: String
      civilState:
        type: Boolean
      parnert:
        firstNameParnert:
          type: String
        secondNameParnert:
          type: String
      birthDate:
        type: Date
      birtCity:
        type: String
      church:
        churchId:
          type: String
        minister:
          type: String
        city:
          type: String
        date:
          type: Date
        charges: [
          charge:
            type: String
        ]
      academicGrade:
        type: String
      sons: [
        firstNameSon:
          type: String
        secondNameSon:
          type: String
      ]
      userName:
        type: String
        unique: true
      password:
        type: String
      token:
        type: String
      tokenExpiration:
        type: Date
      rol:
        type: String

    entity

module.exports = mongoose.model 'Student', Student.load(), 'users'
