tokenizing
nextAttributeValue
	| quote nextChar |

	streamReader atQuote
		ifFalse: [^ self nextName].
	quote := streamReader next.

	context enterLiteralValue.
	writeStream reset.
	[(nextChar := streamReader next) == quote
		or: [nextChar == nil]]
		whileFalse: [
			nextChar == $&
				ifTrue: [
					streamReader peek == $#
						ifTrue: [self nextCharacterReferenceOnWriteStream]
						ifFalse: [self nextGeneralEntityReferenceOnWriteStream]]
				ifFalse: [writeStream nextPut: nextChar]].
	context exitLiteralValue.

	^ writeStream contents.