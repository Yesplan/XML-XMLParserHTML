tokenizing
nextNonHTMLCodeSectionToken
	| isInComment nextChar commentStartChar |

	writeStream reset.
	isInComment := false.
	[streamReader atEnd or: [self atNonHTMLSectionEndTag]]
		whileFalse: [
			isInComment
				ifTrue: [
					nextChar := streamReader next.
					((commentStartChar == $/
						and: [nextChar == streamReader normalizedLineEndingChar])
							or: [commentStartChar == $*
								and: [nextChar == $*
									and: [streamReader peek == $/]]])
						ifTrue: [
							commentStartChar == $*
								ifTrue: [
									writeStream nextPut: $*.
									nextChar := streamReader next].
							isInComment := false].
					writeStream nextPut: nextChar]
				ifFalse: [
					streamReader atQuote
						ifTrue: [self nextQuotedStringOnWriteStream]
						ifFalse: [
							(((nextChar := streamReader next) == $/)
								and: [streamReader peek == $*
									or: [streamReader peek == $/]])
								ifTrue: [
									isInComment := true.
									writeStream
										nextPut: $/;
										nextPut: (commentStartChar := streamReader next)]
								ifFalse: [writeStream nextPut: nextChar]]]].
	context := context contentContext.

	driver handleNonHTMLSection: writeStream contents.