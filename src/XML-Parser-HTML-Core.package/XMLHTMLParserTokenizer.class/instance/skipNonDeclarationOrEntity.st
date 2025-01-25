tokenizing - dtd
skipNonDeclarationOrEntity
	[streamReader atEnd
		or: [(streamReader peek == $<)
			or: [(streamReader peek == $%)
				or: [context isInternalSubsetContext and: [streamReader peek ==$]]]]]]
		whileFalse: [streamReader next].
	