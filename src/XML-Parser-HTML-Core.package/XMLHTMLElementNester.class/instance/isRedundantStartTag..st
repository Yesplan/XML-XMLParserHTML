testing
isRedundantStartTag: anElementName
	anElementName = 'html'
		ifTrue: [^ self startedHTMLSection].
	anElementName = 'head'
		ifTrue: [^ self startedHeadSection].
	anElementName = 'body'
		ifTrue: [^ self startedBodySection].
	^ false.