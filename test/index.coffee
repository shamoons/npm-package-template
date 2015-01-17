'use strict'

should = require 'should'

npmPackage = require '../src'

describe 'First Initial Test', ->
  before (done) ->
    # Insert any setup things for testing here
    done()

  it 'should return zero when zero it passed in', (done) ->
    val = npmPackage 0
    val.should.equal 0
    done()

  it 'should return 10 when 1 it passed in', (done) ->
    val = npmPackage 1
    val.should.equal 10
    done()