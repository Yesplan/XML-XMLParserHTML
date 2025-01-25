tokenizing
nextDoctypeDeclarationOrCommentOrCDataSection
	| nextChar |
	"skip !"
	streamReader next.

	(nextChar := streamReader peek) == $-
		ifTrue: [
			context isXMLDeclarationContext
				ifTrue: [context := context prologContext].
			^ self nextComment].
	nextChar == $[
		ifTrue: [
			^ self
				nextStartContent;
				nextCDataSection].
	context isPostDoctypeDeclarationContext
		ifTrue: [^ self skipDeclaration].
	self nextDoctypeDeclaration.