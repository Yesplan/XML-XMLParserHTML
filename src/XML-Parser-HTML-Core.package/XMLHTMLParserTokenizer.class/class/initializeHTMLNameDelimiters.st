class initialization
initializeHTMLNameDelimiters
	(HTMLNameDelimiters := BitmapCharacterSet new)
		addAll: Character xmlParserSeparators;
		add: $>;
		add: $/;
		add: $<;
		add: $=;
		add: $";
		add: $';
		add: $;