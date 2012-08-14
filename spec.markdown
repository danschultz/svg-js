# JavaScript SVG Library
This is a JS library for working with SVG documents.

## Examples
Creating a document.

	var doc = new SVG.Document("container");

Creating elements in the document.

	var rect = doc.rect({x:5, y:5, width:100, height:100});
	var image = doc.image({url:"dog.jpg"});

Creating definitions in the document.

	var clipPath = doc.defs().clipPath();

Creating nested SVG elements

	var svg = doc.svg();
	var rect = svg.rect({x:5, y:5, width:100, height:100});

Setting border and fills on shapes

	var rect = doc.rect();
	rect.fill({color:"#000000", alpha:0.5});
	rect.stroke({color:"red", weight:2});

Explicitly setting element attributes.

	rect.setAttribute("x", 10);
	rect.setAttribute("x", 10, "http://www.w3.org/2000/svg");

Using helpers to set element attributes.

	rect.move(10, 10).size(50, 50).rotate(45);
	image.load("cat.jpg");
	image.clip(clipPath);