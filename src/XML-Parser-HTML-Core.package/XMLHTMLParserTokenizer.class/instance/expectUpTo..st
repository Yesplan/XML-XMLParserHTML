tokenizing - expecting
expectUpTo: aDelimiter
	| nextChar |

	writeStream reset.
	[streamReader atEnd
		or: [(nextChar := streamReader next) == aDelimiter]]
		whileFalse: [writeStream nextPut: nextChar].
	^ writeStream contents.