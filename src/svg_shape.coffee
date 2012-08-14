class Shape extends SVG.Element

  constructor: (element) ->
    @drag = new SVG.Draggable(this)
    super(element)

  fill: (fill) ->
    @_formatColorIn fill
    @setAttribute("fill", fill.color) if fill.color?
    @setAttribute("fill-opacity", fill.opacity) if fill.opacity?
    return this

  stroke: (stroke) ->
    @_formatColorIn stroke
    @setAttribute("stroke", stroke.color) if stroke.color?
    @setAttribute("stroke-width", stroke.width) if stroke.width?
    @setAttribute("stroke-opacity", stroke.opacity) if stroke.opacity?
    @fill({opacity:0}) unless @attributes["fill-opacity"]?
    return this

  _formatColorIn: (obj) ->
    if typeof obj.color is "number"
      obj.color = "#{obj.color.toString(16)}"
      obj.color = "0" + obj.color while obj.color.length < 6
      obj.color = "##{obj.color}"

class Rect extends Shape

  constructor: () ->
    super(SVG.createElement("rect"))

class Circle extends Shape

  constructor: () ->
    super(SVG.createElement("circle"))

  move: (x, y) ->
    [@attributes.x, @attributes.y] = [x, y]
    @_center()
    this

  size: (value, ignoredHeight) ->
    @setAttribute("r", value/2)
    @_center()

  _center: () ->
    r = @attributes.r or 0
    @setAttribute attr, value for attr, value of {cx:(@attributes.x or 0) + r, cy:(@attributes.y or 0) + r}

class Ellipse extends Shape

  constructor: () ->
    super(SVG.createElement("ellipse"))

  move: (x, y) ->
    [@attributes.x, @attributes.y] = [x, y]
    @_center()
    this

  size: (width, height) ->
    @setAttribute("rx", width/2).setAttribute("ry", height/2)
    @_center()

  _center: () ->
    @setAttribute attr, value for attr, value of {cx:(@attributes.x or 0) + (@attributes.rx or 0), cy:(@attributes.y or 0) + (@attributes.ry or 0)}

this.SVG.Shape = Shape
this.SVG.Rect = Rect
this.SVG.Circle = Circle
this.SVG.Ellipse = Ellipse