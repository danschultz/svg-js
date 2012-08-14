class Draggable

  constructor: (element) ->
    @element = element
    @element.draggable = @draggable
  
  draggable: () =>
    @element.on "mousedown", (e) =>
      @startDragEvent = e
      @startDragPosition = {x:@element.attributes.x || 0, y:@element.attributes.y || 0}
      window.addEventListener "mousemove", @_windowMouseMove
      window.addEventListener "mouseup", @_windowMouseUp
      @element.dragstart?(e)
    return @element
  
  _windowMouseMove: (e) =>
    if @startDragEvent?
      delta = {x:e.pageX - @startDragEvent.pageX, y:e.pageY - @startDragEvent.pageY}
      @element.move(@startDragPosition.x + delta.x, @startDragPosition.y + delta.y)
      @element.dragmove?(delta, e)

  _windowMouseUp: (e) =>
    @startDragEvent = null
    @startDragPosition = null
    window.removeEventListener "mousemove", @_windowMouseMove
    window.removeEventListener "mouseup", @_windowMouseUp
    @element.dragend?(e)

this.SVG.Draggable = Draggable