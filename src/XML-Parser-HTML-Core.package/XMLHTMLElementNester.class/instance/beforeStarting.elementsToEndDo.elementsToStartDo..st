checking
beforeStarting: anElementName elementsToEndDo: anElementEndingBlock elementsToStartDo: anElementStartingBlock
	| htmlTagInfo |

	htmlTagInfo :=
		HTMLTagInformation
			at: anElementName
			ifAbsent: [XMLHTMLTagInformation named: anElementName].
			
	self hasOpenElements
		ifTrue: [
			self
				elementsToEndBeforeStartTag: htmlTagInfo
				do: anElementEndingBlock].
	self
		elementsToStartBeforeStartTag: htmlTagInfo
		do: anElementStartingBlock.