tokenizing - expecting
expectNextAll: aString
	aString do: [:each |
		streamReader peek == each
			ifTrue: [streamReader next]
			ifFalse: [
				self nextName.
				^ aString]].
	^ aString.