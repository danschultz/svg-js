class Object
  
  @moduleKeywords = ['included', 'extended']

  @include: (module) ->
    for key, value of module when key not in @moduleKeywords
      # Assign the properties, methods to the prototype
      this::[key] = value

    module.included?.apply(this)
    return this

this.SVG.Object = Object