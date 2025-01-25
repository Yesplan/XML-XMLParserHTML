handling
handleEndTag: anElementName
	(self elementNester isRedundantEndTag: anElementName)
		ifTrue: [^ self].
	(self elementNester hasOpenElement: anElementName)
		ifFalse: [self startElement: anElementName].
		
	self elementNester
		beforeEnding: anElementName
		elementsToEndDo: [:each | self endElement: each].
	self endElement: anElementName.