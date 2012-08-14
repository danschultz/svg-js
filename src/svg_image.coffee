class Image extends SVG.Element
  
  constructor: () ->
    @drag = new SVG.Draggable(this)
    super(SVG.createElement("image"))

  load: (url) ->
    @setAttribute("href", url, SVG.xlink)
    return this

this.SVG.Image = Image