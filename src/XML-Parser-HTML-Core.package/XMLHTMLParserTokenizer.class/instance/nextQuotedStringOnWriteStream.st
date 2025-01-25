tokenizing
nextQuotedStringOnWriteStream
	| quote isEscaped nextChar |

	quote := streamReader next.
	isEscaped := false.
	writeStream nextPut: quote.
	[streamReader atEnd
		or: [(nextChar := streamReader peek) == quote
			and: [isEscaped not]]]
		whileFalse: [
			isEscaped := (nextChar == $\) and: [isEscaped not].
			writeStream nextPut: streamReader next].
	streamReader next.
	writeStream nextPut: quote.