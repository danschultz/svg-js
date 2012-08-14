class Defs extends SVG.Element

  @include SVG.Container

  constructor: () ->
    super(SVG.createElement("defs"))

  clipPath: () ->
    element = new SVG.ClipPath()
    @add(element)
    element

this.SVG.Defs = Defs