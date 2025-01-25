encodings
checkForCharsetInMetaAttributes: anAttributeDictionary
	anAttributeDictionary
		at: 'charset'
		ifPresent: [:charset | ^ self convertFromEncoding: charset].

	(anAttributeDictionary at: 'http-equiv') = 'Content-Type'
		ifTrue: [
			anAttributeDictionary
				at: 'content'
				ifPresent: [:content |
					((content copyAfter: $=) reject: [:each | each xmlParserIsSeparator])
						ifNotEmpty: [:charset | self convertFromEncoding: charset]]].