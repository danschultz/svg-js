# SVG JS
SVG JS is a JavaScript library for creating and interacting with SVG elements.

## Overview
SVG JS provides an object oriented way of interacting with SVG elements.

*A simple SVG document*
	
```javascript
	# JavaScript
	var doc = new SVG.Document("container").size(300, 300);
	var rect = doc.rect({width:100, height:100}).fill({color:"red"});
```

```html
	<body>
		<div id="container">
			<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xlink="http://www.w3.org/1999/xlink" width="300" height="300">
				<rect width="100" height="100" fill-color="red"></rect>
			</svg>
		</div>
	</body>
```

## Compiling
SVG JS can be compiled using the Cake compile task. Run `cake -T` to find available tasks and their options.

### Examples
* `cake compile`. Compile the source to the default `lib` folder.
* `cake --output bin/svg.js compile`. Compile source to `bin/svg.js`.
* `cake --watch compile`. Compile whenever a source file changes.