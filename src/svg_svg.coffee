class SVGSVG extends SVG.Element
  
  @include SVG.Container

  constructor: () ->
    @drag = new SVG.Draggable(this)
    super(SVG.createElement("svg"))
    @setAttribute("overflow", "visible")

this.SVG.SVG = SVGSVG