mongoose = require 'mongoose'
Schema = mongoose.Schema

class Authoritie

  @load: () ->
    entity = new Schema
      typeDoc:
        type: Number
        default: 3
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
      birthDate:
        type: Date
      birtCity:
        type: String
      academicDegree:
        type: String
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

module.exports = mongoose.model 'Authoritie', Authoritie.load(), 'users'
