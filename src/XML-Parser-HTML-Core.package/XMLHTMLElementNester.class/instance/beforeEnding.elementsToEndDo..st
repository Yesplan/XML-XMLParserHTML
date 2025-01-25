checking
beforeEnding: anElementName elementsToEndDo: anElementEndingBlock
	self openElementsReverseDo: [:each |
		each = anElementName
			ifTrue: [^ self].
		anElementEndingBlock value: each].