private
startElement: anElementName attributes: anAttributeDictionary
	| prefix |

	self elementNester startElement: anElementName.

	prefix := anElementName prefixBeforeLocalName.
	self saxHandler 
		startElement: anElementName
		prefix: prefix
		uri: ''
		localName: (anElementName localNameAfterPrefix: prefix)
		attributes: anAttributeDictionary