'use strict'

mongoose = require 'mongoose'
should = require 'should'

kaijuData = require '../src'


describe 'DB Connection', ->
  before (done) ->
    dbConnection =
      host: 'localhost'
      port: 27017
      database: 'kaijutest'

    mongoose.connect "mongodb://#{dbConnection.host}:#{dbConnection.port}/#{dbConnection.database}", (err) ->
      done err

  it 'should return a TickModel that can insert and find', (done) ->
    newtick = new kaijuData.Tick
      instrument: 'EUR_USD'
      openBid: 1
      openAsk: 2
      highBid: 13
      highAsk: 23
      lowBid: 0.23
      lowAsk: 0.33
      closeBid: 0.93
      closeAsk: 0.13
      volume: 1
      time: (new Date()).getTime()

    newtick.save (err) ->
      should.not.exist err

      kaijuData.Tick.findOne
        time: newtick.time
      .exec (err, dbTick) ->
        should.not.exist err
        dbTick.time.should.equal newtick.time
        done()