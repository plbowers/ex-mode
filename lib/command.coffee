ExViewModel = require './ex-view-model'
Ex = require './ex'

class CommandError
  constructor: (@message) ->
    @name = 'Command Error'

class Command
  constructor: (@editor, @exState) ->
    @viewModel = new ExViewModel(@)

  execute: (input) ->
    return unless input.characters.length > 0

    func = (new Ex)[input.characters]
    if func?
      func()
    else
      throw new CommandError("#{input.characters}")

module.exports = {Command, CommandError}
