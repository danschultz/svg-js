class Group extends SVG.Element

  @include SVG.Container

  constructor: () ->
    super(SVG.createElement("g"))

  rotate: (degrees) ->
    @setAttribute("transform", "rotate(#{degrees})")
    return this

this.SVG.Group = Group