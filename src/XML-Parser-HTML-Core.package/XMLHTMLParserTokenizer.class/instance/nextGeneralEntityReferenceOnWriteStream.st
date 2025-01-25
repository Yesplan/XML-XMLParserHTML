tokenizing
nextGeneralEntityReferenceOnWriteStream
	| name character |

	name := self nextName.
	character :=
		HTMLEntities
			at: name
			ifAbsent: [^ self nextUnreplacedGeneralEntityOnWriteStreamNamed: name].
	driver replacesContentEntityReferences
		ifFalse: [^ self nextUnreplacedGeneralEntityOnWriteStreamNamed: name].
	streamReader peek == $; "; is optional"
		ifTrue: [streamReader next].
	writeStream nextPut: character.
	^ true.