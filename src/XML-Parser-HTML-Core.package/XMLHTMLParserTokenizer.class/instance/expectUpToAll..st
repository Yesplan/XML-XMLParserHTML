tokenizing - expecting
expectUpToAll: aString
	writeStream reset.
	[streamReader atEnd or: [streamReader nextMatchAll: aString]]
		whileFalse: [writeStream nextPut: streamReader next].
	^ writeStream contents.