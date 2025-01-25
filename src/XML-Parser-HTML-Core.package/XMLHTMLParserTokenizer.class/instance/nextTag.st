tokenizing
nextTag
	| tagName attributes attributeName nextChar |

	(streamReader peek == $/)
		ifTrue: [^ self nextEndTag].
	tagName := self nextName asLowercase.

	attributes := OrderPreservingStringDictionary new: 10.
	[streamReader skipSeparators.
	((nextChar := streamReader peek) == $>
		or: [nextChar == $/
			or: [nextChar == nil
				or: [(attributeName := self nextName asLowercase) size = 0]]])]
		whileFalse: [
			streamReader skipSeparators.
			(streamReader peek == $=)
				ifTrue: [streamReader next].
			streamReader skipSeparators.
			attributes
				at: attributeName
				put: self nextAttributeValue].
	tagName = 'meta'
		ifTrue: [self checkForCharsetInMetaAttributes: attributes].
	driver
		handleStartTag: tagName
		attributes: attributes
		namespaces: nil.
	nextChar == $/
		ifTrue: [
			streamReader next.
			driver handleEndTag: tagName]
		ifFalse: [
			(NonHTMLSectionTags includes: tagName)
				ifTrue: [self nextStartNonHTMLElement: tagName]].
	self expectTerminator.