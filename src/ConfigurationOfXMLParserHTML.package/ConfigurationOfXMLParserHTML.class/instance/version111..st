versions
version111: spec 
        <version: '1.1.1' imports: #('1.0.0-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'XML-Parser-HTML-Core' with: 'XML-Parser-HTML-Core-monty.20'.
			spec package: 'XML-Parser-HTML-Tests' with: 'XML-Parser-HTML-Tests-monty.7'.
                ].