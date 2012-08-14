class Document extends SVG.Element

  @include SVG.Container
  
  constructor: (container) ->
    super(SVG.createElement("svg"))
    @setAttribute("xmlns", SVG.namespace)
    @setAttribute("version", "1.1")
    @setAttribute("xlink", "http://www.w3.org/1999/xlink", SVG.namespace)
    document.getElementById(container).appendChild(@svgElement)

this.SVG.Document = Document