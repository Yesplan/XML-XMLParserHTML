tokenizing
nextCharacterReferenceOnWriteStream
	| reader character |

	"skip $#"
	streamReader next.
	nameStream reset.
	(reader := XMLIntegerReader on: streamReader)
		printStream: nameStream.
	character :=
		self characterFromCodePoint:
			(reader
				nextIntegerWithBase: 16
				startingWithAny: 'Xx'
				orBase: 10).
	(character notNil
		and: [driver replacesContentEntityReferences])
		ifTrue: [
			streamReader peek == $; "; is optional"
				ifTrue: [streamReader next].
			writeStream nextPut: character]
		ifFalse: [
			writeStream
				nextPutAll: '&#';
				nextPutAll: nameStream contents].
	^ true.