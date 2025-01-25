catalog
catalogKeyClassesAndExample

	^ 'The main classes are ==SAXHTMLHandler== and ==XMLHTMLParser== (DOM).
	
	Here is an example:
[[[ 
	"get all links from the Pharo homepage"
	((XMLHTMLParser parseURL: ''http://pharo.org'') allElementsNamed: ''a'')
		collect: [:each | each attributeAt: ''href''].
]]]'