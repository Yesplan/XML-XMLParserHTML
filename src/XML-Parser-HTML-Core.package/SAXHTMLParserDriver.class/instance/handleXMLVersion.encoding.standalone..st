handling
handleXMLVersion: aVersion encoding: anEncoding standalone: aYesOrNo
	self saxHandler
		xmlVersion:
			([aVersion asNumber]
				on: Error
				do: [:error | 1.0])
		encoding: anEncoding
		standalone: false