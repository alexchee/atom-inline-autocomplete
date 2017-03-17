class WordNode
  constructor: ({@word, @buffer, @row}) ->

  distanceFrom: (otherWord) ->
    linesOffset = if @buffer? then @buffer.getLineCount() else 0
    bufferDiff = if @buffer? && otherWord.buffer? then @buffer.id.localeCompare(otherWord.buffer.id) else 3
    Math.abs(bufferDiff * linesOffset + (otherWord.row - @row))

  buffersCount: ->
    buffers.size

  resetBuffersCount: ->
    buffers.clear()

module.exports = WordNode
