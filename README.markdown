# SVG JS
SVG JS is a JavaScript library for creating and interacting with SVG elements.

## Overview
SVG JS provides an object oriented way of interacting with SVG elements.

*A simple SVG document*
	
```javascript
var doc = new SVG.Document("container").size(300, 300);
var rect = doc.rect({width:100, height:100}).fill({color:"red"});
```

```html
<div id="container">
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xlink="http://www.w3.org/1999/xlink" width="300" height="300">
		<rect width="100" height="100" fill-color="red"></rect>
	</svg>
</div>
```

*Clipping elements*
```javascript
// Clip a rectangle using a block function. This creates a new clip path, and passes it in to the block.
rect.clip(function(clipPath)
{
	clipPath.rect({x:10, y:10, width:80, height:80})
});

// Clip a rectangle by creating a clip path.
var clipPath = doc.defs().clipPath();
clipRect = clipPath.rect({x:10, y:10, width:80, height:80})
rect.clipTo(clipPath)
```

*Create SVG nodes from any SVG container*
```javascript
// Create an image tag.
image = doc.image()

// Create a nested SVG node with a rect.
svg = doc.svg()
rect = svg.rect()
```

## Compiling
SVG JS can be compiled using the Cake compile task. Run `cake` to see all available tasks and their options.

### Examples
* `cake compile`. Compile the source to the default `lib` folder.
* `cake --output bin/svg.js compile`. Compile source to `bin/svg.js`.
* `cake --watch compile`. Compile whenever a source file changes.