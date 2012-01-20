should = require 'should'
{ deserialize } = require '../src/serializer'
{ verify } = require './spec_helper'

describe 'command deserializer', ->

  should_not_deserialize = (commands) ->
    should.equal undefined, deserialize command for command in commands

  it 'should expect command to be enclosed in brackets', ->

    should_not_deserialize [
      undefined
      null
      ''
      'command'
      '[command'
      'command]'
    ]

    verify deserialize('[command]')?

  it 'should deserialize single element', ->

    deserialize('[000003:bye]').
      should.eql ['bye']