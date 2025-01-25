tokenizing
nextQuotedValue
	^ streamReader atQuote
		ifTrue: [self expectUpTo: streamReader next]
		ifFalse: [self nextName]