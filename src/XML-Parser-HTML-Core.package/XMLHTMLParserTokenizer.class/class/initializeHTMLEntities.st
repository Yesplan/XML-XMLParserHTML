class initialization
initializeHTMLEntities
	| entityPage entityName codePoint |

	HTMLEntities := Dictionary new.
	entityPage := self htmlEntityPage readStream.
	[entityPage atEnd]
		whileFalse: [
			entityPage skipTo: $[.
			entityName := entityPage upTo: $=.
			codePoint := (XMLIntegerReader readFrom: entityPage).
			(entityName notEmpty and: [codePoint notNil])
				ifTrue: [
					HTMLEntities
						at: entityName
						put: codePoint asCharacter]].