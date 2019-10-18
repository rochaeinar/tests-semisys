mongoose = require 'mongoose'
Schema = mongoose.Schema

class Rol

  @load: () ->
    entity = new Schema
      name:
        type: String
        unique: true
      permissions:
        type: [{}]
    entity

module.exports = mongoose.model 'Rols', Rol.load()
