mongoose = require 'mongoose'
Schema = mongoose.Schema

class Logs

  @load: () ->
    entity = new Schema
      date:
        type: Date
      type:
        type: String
      message:
        type: String
    entity

module.exports = mongoose.model 'Logs', Logs.load()
