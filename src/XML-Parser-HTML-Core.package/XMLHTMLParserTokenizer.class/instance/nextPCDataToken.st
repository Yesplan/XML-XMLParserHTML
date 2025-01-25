tokenizing
nextPCDataToken
	| isIgnorableWhitespace nextChar |

	isIgnorableWhitespace := true.
	writeStream reset.
	[(nextChar := streamReader peek) == $<
		or: [nextChar == nil]]
		whileFalse: [
			streamReader next == $&
				ifTrue: [
					"nil understands xmlParserIsSeparator so no nil test is needed"
					streamReader peek xmlParserIsSeparator
						ifTrue: [
							writeStream nextPut: $&.
							isIgnorableWhitespace := false]
						ifFalse: [
							(streamReader peek == $#
								ifTrue: [self nextCharacterReferenceOnWriteStream]
								ifFalse: [self nextGeneralEntityReferenceOnWriteStream])
								ifTrue: [isIgnorableWhitespace := false]]]
				ifFalse: [
					isIgnorableWhitespace
						ifTrue: [isIgnorableWhitespace := nextChar xmlParserIsSeparator].
					writeStream nextPut: nextChar]].
	isIgnorableWhitespace
		ifTrue: [
			writeStream xmlParserAtBeginning
				ifFalse: [driver handleWhitespace: writeStream contents]]
		ifFalse: [driver handlePCData: writeStream contents].