mongoose = require 'mongoose'
Schema = mongoose.Schema

class Subject

  @load: () ->
    entity = new Schema
      name:
        type: String
      code:
        type: String
    entity

module.exports = mongoose.model 'Subject', Subject.load()
