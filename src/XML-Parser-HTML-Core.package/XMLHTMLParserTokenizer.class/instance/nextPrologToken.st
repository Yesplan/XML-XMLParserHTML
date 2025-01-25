tokenizing
nextPrologToken
	streamReader skipSeparators.
	streamReader atEnd
		ifTrue: [^ self].
	streamReader peek == $<
		ifFalse: [
			^ self
				nextStartContent;
				nextContentToken].
	streamReader next.
	streamReader peek == $?
		ifTrue: [^ self nextPIOrXMLDeclaration].
	streamReader peek == $!
		ifTrue: [^ self nextDoctypeDeclarationOrCommentOrCDataSection].

	self nextStartContent.
	"nil understands xmlParserIsSeparator so no nil test is needed"
	streamReader peek xmlParserIsSeparator
		ifTrue: [
			streamReader pushBackCharacter: $<.
			^ self nextContentToken].
	self nextTag.