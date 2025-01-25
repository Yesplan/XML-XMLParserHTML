tokenizing
nextNonHTMLSectionToken
	writeStream reset.
	[streamReader atEnd or: [self atNonHTMLSectionEndTag]]
		whileFalse: [writeStream nextPut: streamReader next].
	context := context contentContext.

	driver handleNonHTMLSection: writeStream contents.