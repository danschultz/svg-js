# SVG JS
SVG JS is a JavaScript library for creating and interacting with SVG content.

This library aims to:

* Provide an object oriented interface for working with SVG.
* Provide utilities and helpers for modifying SVG elements.
* Provide an abstraction for the SVG spec.
* Not have any dependencies on other JavaScript libraries.

This library does not provide cross-browser support.

## Overview

### A simple SVG document

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

### Clipping elements
Clipping elements in SVG JS can be done with either `clip()` or `clipTo()`.

Using `clip()` creates a clip path in the parents `defs` node, and passes it to a block.
```javascript
rect.clip(function(clipPath)
{
	clipPath.rect({x:10, y:10, width:80, height:80})
});
```

You can also create reuse clip paths for multiple elements using `clipTo()`.
```javascript
var clipPath = doc.defs().clipPath();
clipRect = clipPath.rect({x:10, y:10, width:80, height:80});
rect.clipTo(clipPath)
```

### Creating new SVG elements
Containers in SVG JS have creators for new sub-elements.

```javascript
// Create an image tag.
image = doc.image()

// Create a nested SVG node with a rect.
svg = doc.svg()
rect = svg.rect()
```

### Explicitly setting attributes
You can set an element's attributes directly with `setAttribute()`. This is useful for functionality that hasn't been implemented by SVG JS.

```javascript
rect.setAttribute("x", 50);

// Set an attribute with a namespace
rect.setAttribute("x", 50, "http://www.w3.org/2000/svg");
```

## Compiling
SVG JS can be compiled using the Cake compile task. Run `cake` to see all available tasks and their options.

### Examples
* `cake compile`. Compile the source to the default `lib` folder.
* `cake --output bin/svg.js compile`. Compile source to `bin/svg.js`.
* `cake --watch compile`. Compile whenever a source file changes.