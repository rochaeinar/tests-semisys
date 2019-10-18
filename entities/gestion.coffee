mongoose = require 'mongoose'
Schema = mongoose.Schema

class Gestion

  @load: () ->
    entity = new Schema
      code:
        type: String
      period:
        type: String
      start:
        type: Date
      end:
        type: Date
    entity

module.exports = mongoose.model 'Gestion', Gestion.load()
