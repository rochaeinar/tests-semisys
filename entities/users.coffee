mongoose = require 'mongoose'
Schema = mongoose.Schema

class Users

  @load: () ->
    entity = new Schema
      userName:
        type: String
        index: true
        unique: true
      password:
        type: String
        required: true
      token:
        type: String
      tokenExpiration:
        type: Date
      rol:
        type: String
      email:
        type: String
      failAttempts:
        type: Number
      lastFail:
        type: Date
      timeLock:
        type: Number
    entity

module.exports = mongoose.model 'Users', Users.load()
