this.SVG.Dispatcher =
  
  on: (events, listener) ->
    @svgElement.addEventListener event, listener for event in events.split(" ")

  off: (events, listener) ->
    @svgElement.removeEventListener event, listener for event in events.split(" ")