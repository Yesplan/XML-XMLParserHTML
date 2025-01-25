baselines
baseline100: spec
	<version: '1.0.0-baseline'>
	spec
		for: #common
		do: [ 
			spec
				blessing: #baseline;
				description: 'XML-Parser-HTML baseline';
				"migrated from PharoExtras/XMLParser to PharoExtras/XMLParserHTML"
				repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParserHTML/main'.
			spec
				project: 'XMLParser'
				with: [ 
					spec
						className: 'ConfigurationOfXMLParser';
						versionString: #stable;
						loads: #('default');
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main' ].
			spec package: 'XML-Parser-HTML-Core' with: [ spec requires: 'XMLParser' ].
			spec package: 'XML-Parser-HTML-Tests' with: [ spec requires: 'XML-Parser-HTML-Core' ].
			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('XML-Parser-HTML-Core');
				group: 'Tests' with: #('XML-Parser-HTML-Tests')].

	"load gemstone methods"
	spec
		for: #'gemstone'
		do: [
			spec
				package: 'XML-Parser-HTML-Core'
				with: [ spec includes: 'XML-Parser-HTML-GemstoneCompatibility' ].
			spec
				package: 'XML-Parser-HTML-GemstoneCompatibility'
				with: [ spec requires: 'XML-Parser-HTML-Core' ]. ].