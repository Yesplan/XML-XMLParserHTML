tokenizing
nextContentMarkupToken
	"nil understands xmlParserIsSeparator so no nil test is needed"
	streamReader peek xmlParserIsSeparator
		ifTrue: [
			streamReader pushBack: '&lt;'.
			^ self nextPCDataToken].
	streamReader peek == $?
		ifTrue: [^ self nextPI].
	streamReader peek == $!
		ifTrue: [
			streamReader next.
			streamReader peek == $-
				ifTrue: [^self nextComment].
			^ self nextCDataSection].
	self nextTag.