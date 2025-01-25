private
htmlTagInfoFor: aName
	^ HTMLTagInformation
		at: aName
		ifAbsentPut: [XMLHTMLTagInformation named: aName]