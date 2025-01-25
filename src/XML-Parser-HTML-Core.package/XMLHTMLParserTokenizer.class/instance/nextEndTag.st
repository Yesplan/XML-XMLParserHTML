tokenizing
nextEndTag
	"Skip /"
	streamReader next.
	driver handleEndTag: self nextName asLowercase.
	streamReader skipSeparators.
	self expectTerminator.