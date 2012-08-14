class SVG

  @namespace: "http://www.w3.org/2000/svg"
  @xlink: "http://www.w3.org/1999/xlink"
  @createElement: (element) ->
    document.createElementNS(@namespace, element)

this.SVG = SVG