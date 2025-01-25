private
endElement: anElementName
	| prefix |

	self elementNester endElement: anElementName.

	prefix := anElementName prefixBeforeLocalName.	
	self saxHandler 
		endElement: anElementName
		prefix: prefix
		uri: ''
		localName: (anElementName localNameAfterPrefix: prefix)