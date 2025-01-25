private
startInnerXMLElement: anElement forParser: aParser
	| elementNester |

	(elementNester := aParser driver elementNester)
		beforeStarting: anElement name
		elementsToEndDo: [:each | ]
		elementsToStartDo: [:each | elementNester startElement: each];
		startElement: anElement name