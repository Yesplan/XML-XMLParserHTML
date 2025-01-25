tokenizing
nextName
	| nextChar |

	nameStream reset.
	 [(nextChar := streamReader peek) == nil
		or: [(HTMLNameDelimiters includes: nextChar)
			or: [(context isDoctypeDeclarationContext and: [nextChar == $[])
				or: [context isInternalSubsetContext and: [nextChar == $]]]]]]
		whileFalse: [nameStream nextPut: streamReader next].
	^ nameStream contents.