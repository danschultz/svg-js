class Element extends SVG.Object

  @include SVG.Dispatcher
  
  constructor: (svgElement) ->
    @svgElement = svgElement
    @attributes = {}

  move: (x, y) ->
    @setAttribute attr, value for attr, value of {x:x, y:y}
    this

  opacity: (value) ->
    @setAttribute("opacity", Math.max(0, Math.min(1, value)))

  size: (width, height) ->
    @setAttribute attr, value for attr, value of {width:width, height:height}
    this

  clip: (block) ->
    path = @parentSVG().defs().clipPath()
    block(path)
    @clipTo(path)

  clipTo: (clipPath) ->
    @setAttribute("clip-path", "url(##{clipPath.id})")

  destroy: () ->
    @parent?.remove(this)

  parentDoc: () ->
    @_findParent(SVG.Document)

  parentSVG: () ->
    @_findParent(SVG.SVG) or @parentDoc()

  setAttribute: (attr, value, namespace) ->
    @attributes[attr] = value
    if namespace?
      @svgElement.setAttributeNS(namespace, attr, value)
    else
      @svgElement.setAttribute(attr, value)
    this

  _findParent: (parentType) ->
    e = this
    while e? and e not instanceof parentType
      e = e.parent
    e
    
this.SVG.Element = Element