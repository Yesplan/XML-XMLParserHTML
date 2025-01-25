baselines
baseline: spec

	<baseline>

	spec for: #common do: [
		spec baseline: 'XMLParser' with: [
			spec
				loads: 'Core';
				repository: 'github://Yesplan/XML-XMLParser:48f32c0457d189841777e32ddd92df346520aa8a/src' ].

		spec package: 'XML-Parser-HTML-Core' with: [ spec requires: 'XMLParser' ].
		
		spec group: 'Core' with: #('XML-Parser-HTML-Core') ]
