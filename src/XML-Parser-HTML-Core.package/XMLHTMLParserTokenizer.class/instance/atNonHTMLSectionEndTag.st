testing
atNonHTMLSectionEndTag
	| matches elementName |

	streamReader peek == $<
		ifFalse: [^ false].
	streamReader next.
	streamReader peek == $/
		ifFalse: [
			streamReader pushBackCharacter: $<.
			^ false].
	streamReader next.

	elementName := context element.
	1 to: elementName size do: [:i | | nextChar |
		((nextChar := streamReader peek) notNil
			and: [nextChar asLowercase == (elementName at: i)])
			ifFalse: [
				streamReader pushBack: '</', (elementName copyFrom: 1to: i - 1).
				^ false].
		streamReader next].
	matches :=
		streamReader atEnd not
			and: [HTMLNameDelimiters includes: streamReader peek].
	streamReader pushBack: '</', elementName.

	^ matches.