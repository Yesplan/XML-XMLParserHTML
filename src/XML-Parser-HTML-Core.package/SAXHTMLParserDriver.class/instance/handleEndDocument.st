handling
handleEndDocument
	self elementNester
		openElementsReverseDo: [:each | self endElement: each];
		endNesting.

	self saxHandler endDocument.