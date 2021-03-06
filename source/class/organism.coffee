###
Base class for Organism

@namespace Atoms.Class
@class Organism

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Class.Organism extends Atoms.Core.Module

  @include Atoms.Core.Scaffold
  @include Atoms.Core.Children
  @include Atoms.Core.Event
  @include Atoms.Core.Output

  @type = "Organism"

  #@TODO: Better if I use a instance variable. Change It!
  _scaffold = undefined

  @scaffold: (url) -> _scaffold = @requestJSON url

  @requestJSON = (url) ->
    loader = if $$? then $$ else $
    scaffold = loader.ajax
      url     : url
      async   : false
      dataType: "text"
      error   : -> throw "Error loading scaffold in #{url}"
    JSON.parse scaffold.responseText

  ###
  Prepare Organism instance
  @method constructor
  @param  attributes  OBJECT
  @param  scaffold    STRING
  ###
  constructor: (@attributes, scaffold) ->
    super
    @children = []
    _scaffold = @constructor.requestJSON scaffold if scaffold
    @attributes = Atoms.Core.Helper.mix @attributes, _scaffold
    _scaffold = undefined

  ###
  Render element with custom template and instance all Atom/Molecule children.
  @method render
  ###
  render: ->
    do @scaffold
    do @output
    do @chemistry
