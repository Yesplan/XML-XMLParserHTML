private
pushInnerXMLRootNode: aRootNode
	aRootNode ancestorNodes reverseDo: [:each | self pushNode: each].
	super pushInnerXMLRootNode: aRootNode.