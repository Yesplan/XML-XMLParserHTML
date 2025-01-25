class initialization
initializeHTMLTagInformation
	HTMLTagInformation := Dictionary new.

	#('html' 'head' 'body') do: [:each | self htmlTagInfoFor: each].

	self bodySectionElements do: [:each |
		(self htmlTagInfoFor: each) isBodySectionTag: true].
	self headSectionElements do: [:each |
		(self htmlTagInfoFor: each) isHeadSectionTag: true].

	self mutuallyExcludingTags keysAndValuesDo: [:key :value |
		(self htmlTagInfoFor: key) mutuallyExcludingTag: value].
	self nestableTagGroups keysAndValuesDo: [:key :value |
		(self htmlTagInfoFor: key) nestableTagGroup: value].

	self nonNestableElements do: [:each |
		(self htmlTagInfoFor: each) isNonNestable: true].