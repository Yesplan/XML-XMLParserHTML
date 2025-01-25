baselines
baseline114: spec
	<version: '1.1.4-baseline' imports: #('1.0.0-baseline')>
	spec
		for: #common
		do: [ spec project: 'XMLParser' with: #'release-2.5' ].
	spec
		for: #gemstone
		do: [ 
			spec blessing: #baseline.
			spec package: 'XML-Parser-HTML-GemstoneCompatibility' with: 'XML-Parser-HTML-GemstoneCompatibility-monty.1' ]