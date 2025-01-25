tokenizing
nextStartNonHTMLElement: anElement
	context := 
		((NonHTMLCodeSectionTags includes: anElement)
			ifTrue: [XMLHTMLNonHTMLCodeSectionContext]
			ifFalse: [XMLHTMLNonHTMLSectionContext]) element: anElement