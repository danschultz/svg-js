this.SVG.Container =
  
  add: (element) ->
    @addAt(element)

  addAt: (element, index) ->
    unless @contains(element)
      index ?= @children().length
      @children().splice(index, 0, element)
      @svgElement.insertBefore(element.svgElement, @svgElement.childNodes[index+1])
      element.parent = this
    this

  contains: (element) ->
    element in @children()

  children: () ->
    @_children ?= []

  sendBack: (element) ->
    i = @children().indexOf(element)
    @remove(element).addAt(element, i-1) if i isnt -1

  bringForward: (element) ->
    i = @children().indexOf(element)
    @remove(element).addAt(element, i+1) if i isnt -1

  bringToFront: (element) ->
    @remove(element).add(element) if @contains(element)
    this

  sendToBottom: (element) ->
    @remove(element).addAt(element, 0) if @contains(element)
    this

  remove: (element) ->
    @removeAt(@children().indexOf(element))

  removeAt: (i) ->
    if 0 <= i < @children().length
      element = @children()[i]
      @children().splice(i, 1)
      @svgElement.removeChild(element.svgElement)
      element.parent = null
    this

  defs: () ->
    unless @_defs?
      @_defs = new SVG.Defs()
      @add(@_defs)
    @_defs

  group: () ->
    element = new SVG.Group()
    @add(element)
    element

  svg: (values) ->
    @positionSizeAndAdd(new SVG.SVG(), values)

  rect: (values) ->
    @positionSizeAndAdd(new SVG.Rect(), values)

  circle: (values) ->
    @positionSizeAndAdd(new SVG.Circle(), {x:values?.x, y:values?.y, width:values?.width or values?.r or values?.radius, height:null})

  ellipse: (values) ->
    @positionSizeAndAdd(new SVG.Ellipse(), {x:values?.x, y:values?.y, width:values?.width or values?.rx or values?.radiusX, height:values?.height or values?.ry or values?.radiusY})

  image: (values) ->
    @positionSizeAndAdd(new SVG.Image(), values)

  positionSizeAndAdd: (element, values) ->
    element.move(values.x, values.y) if values? && values.x? && values.y?
    element.size(values.width, values.height) if values? && values.width? && values.height?
    @add(element)
    element