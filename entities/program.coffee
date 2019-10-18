mongoose = require 'mongoose'
Schema = mongoose.Schema

class Program

  @load: () ->
    entity = new Schema
      name:
        type: String
      code:
        type: String
      subjects: [
        id:
          type: String
      ]
    entity

module.exports = mongoose.model 'Program', Program.load()
