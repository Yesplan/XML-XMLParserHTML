class initialization
initializeRedundantEndTags
	RedundantEndTags := self voidElements asSet.

	"html/body are redundant end tags because they should remain open until the end"
	RedundantEndTags addAll: #('html' 'body').