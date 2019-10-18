mongoose = require 'mongoose'
Schema = mongoose.Schema

class Church

  @load: () ->
    entity = new Schema
      name:
        type: String
      address:
        type: String
      city:
        type: String
      denomination:
        type: String
    entity

module.exports = mongoose.model 'Church', Church.load()
