WordNode = require '../lib/word-node'
{TextBuffer} = require 'atom'

describe "WordNode", ->
  [word, buffer1] = []

  beforeEach ->
    buffer1 = new TextBuffer "A\ntest\nother\nstuff"
    word = new WordNode word: 'te', buffer: buffer1, row: 1

  describe "attributes", ->
    it "saves word, buffer, and row", ->
      expect(word.row).toEqual 1
      expect(word.word).toEqual 'te'
      expect(word.buffer).toEqual buffer1

  describe "distanceFrom", ->
    it "returns the difference between rows if on same buffer", ->
      otherWord = new WordNode({word: 'test', buffer: buffer1, row: 3})
      expect(word.distanceFrom(otherWord)).toEqual 2

    it "skews row by number buffer line count used buffers if other word node is on different buffer", ->
      word = new WordNode word: 'te', buffer: buffer1, row: 1
      buffer2 = new TextBuffer "Other\nbuffer\ntest other"
      otherBufferWord = new WordNode({word: 'test', buffer: buffer2, row: 2})
      expect(word.distanceFrom(otherBufferWord)).toEqual 5

    it "does not skew row distance if buffer is null", ->
      noBufferWord = new WordNode word: "tests", row: 2
      expect(noBufferWord.distanceFrom(word)).toEqual 1

    it "does not skew row distance if both word node buffers are null", ->
      noBufferWord = new WordNode word: "t", row: 2
      noBufferWord2 = new WordNode word: "tests", row: 5
      expect(noBufferWord.distanceFrom(noBufferWord2)).toEqual 3
