'use strict'

mongoose = require 'mongoose'
TickModel = require './models/tick'

class KaijuDataModel
  Tick: TickModel

module.exports = new KaijuDataModel()