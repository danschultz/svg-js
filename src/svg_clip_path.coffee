class ClipPath extends SVG.Element
  
  @include SVG.Container
  
  @clipID: 0
  @generateClipID: () ->
    @clipID++

  constructor: () ->
    super(SVG.createElement("clipPath"))
    @id = "_#{ClipPath.generateClipID()}"
    @setAttribute("id", "#{@id}")

this.SVG.ClipPath = ClipPath